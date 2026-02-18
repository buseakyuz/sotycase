import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sotycase/product/cache/secure_storage_manager.dart';
import 'package:sotycase/product/models/base/base_response.dart';

import '../../../features/auth/models/token_model.dart';

class TokenRefreshInterceptor extends Interceptor {
  final Dio dio;
  final Future<void> Function() onLogout;

  // Simple flag to avoid multiple token refresh attempts
  static bool _isRefreshing = false;

  TokenRefreshInterceptor({required this.dio, required this.onLogout});

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      log('TokenRefreshInterceptor: Access Token expired. Attempting to refresh...');

      try {
        final newTokens = await _refreshAccessToken();
        if (newTokens != null) {
          log('TokenRefreshInterceptor: Token refresh successful. Retrying original request.');
          // Update the original request's header with the new token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';

          _isRefreshing = false;
          // Retry the request
          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        log('TokenRefreshInterceptor: Token refresh failed. Logging out.', error: e);
        // If refresh fails, logout
        await onLogout();
      } finally {
        _isRefreshing = false;
      }
    }

    return handler.next(err);
  }

  Future<TokenModel?> _refreshAccessToken() async {
    try {
      final refreshToken = await SecureStorageManager.instance.getRefreshToken();
      if (refreshToken == null) {
        throw Exception('No refresh token available.');
      }

      // ASSUMPTION: The 'signIn' endpoint is used for refreshing the token
      // by sending the refreshToken. This is a guess based on the available endpoints.
      final response = await dio.post(
        'Auth/SignIn',
        data: {'refreshToken': refreshToken, 'grantType': 'refresh_token'},
      );

      final baseResponse = BaseResponse<dynamic>.fromJson(response.data, (json) => json);

      if (baseResponse.responseData != null) {
        final newTokens = TokenModel.fromJson(baseResponse.responseData as Map<String, dynamic>);
        if (newTokens.accessToken != null && newTokens.refreshToken != null) {
          await SecureStorageManager.instance.saveTokens(
            accessToken: newTokens.accessToken!,
            refreshToken: newTokens.refreshToken!,
          );
          return newTokens;
        }
      }
      throw Exception('Failed to parse new tokens from refresh response.');
    } catch (e) {
      log('TokenRefreshInterceptor: _refreshAccessToken error.', error: e);
      rethrow;
    }
  }
}
