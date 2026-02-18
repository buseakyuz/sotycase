import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:sotycase/product/models/base/base_response.dart';

import '../../../features/auth/models/token_model.dart';
import '../../cache/secure_storage_manager.dart';

/// A custom exception to indicate that the token refresh has failed
/// and the user should be logged out.
class TokenRefreshException extends DioException {
  TokenRefreshException({required super.requestOptions});

  @override
  String toString() => 'TokenRefreshException: Failed to refresh token. User should be logged out.';
}

class AuthInterceptor extends Interceptor {
  final Dio dio;
  static bool _isRefreshing = false;

  AuthInterceptor({required this.dio});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Exclude login path from auth check
    if (options.path.contains('Auth/SignIn')) {
      return handler.next(options);
    }

    final token = await SecureStorageManager.instance.getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      developer.log('AuthInterceptor: Token added to headers for ${options.path}');
      return handler.next(options);
    }

    developer.log('AuthInterceptor: No token found for ${options.path}. Rejecting request.');
    return handler.reject(
      DioException(
        requestOptions: options,
        response: Response(
          requestOptions: options,
          statusCode: 401,
          statusMessage: 'Authentication Token Missing',
        ),
      ),
    );
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.path.contains('Auth/SignIn') &&
        !_isRefreshing) {
      _isRefreshing = true;
      developer.log('AuthInterceptor: Access Token expired. Attempting to refresh...');

      try {
        final newTokens = await _refreshAccessToken();
        developer.log('AuthInterceptor: Token refresh successful. Retrying request.');
        
        // Update the original request's header and retry
        err.requestOptions.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';
        final response = await dio.fetch(err.requestOptions);
        
        return handler.resolve(response);

      } catch (e) {
        developer.log('AuthInterceptor: Token refresh failed.', error: e);
        // If refresh fails, reject with a custom exception to signal logout
        return handler.reject(TokenRefreshException(requestOptions: err.requestOptions));
      } finally {
        _isRefreshing = false;
      }
    }
    return handler.next(err);
  }

  Future<TokenModel> _refreshAccessToken() async {
    final refreshToken = await SecureStorageManager.instance.getRefreshToken();
    if (refreshToken == null) throw Exception('No refresh token available.');
    
    // Use a new Dio instance for the refresh token request to avoid
    // running into the same interceptor and creating a loop.
    final refreshDio = Dio(BaseOptions(baseUrl: dio.options.baseUrl));

    try {
      final response = await refreshDio.post(
        'Auth/SignIn',
        data: {
          'grantType': 'refresh_token',
          'refreshToken': refreshToken,
        },
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
    } on DioException catch (e) {
       developer.log('AuthInterceptor: Dio error during token refresh.', error: e.response?.data);
    }
    throw Exception('Failed to refresh token.');
  }
}
