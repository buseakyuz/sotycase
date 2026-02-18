import 'package:dio/dio.dart';
import 'dart:developer' as developer;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../product/cache/secure_storage_manager.dart';
import '../../../../product/network/network_provider.dart';
import '../../../../product/network/services/auth/auth_service.dart';
import '../models/auth_result.dart';
import '../models/token_model.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(Dio dio) : _authService = AuthService(dio);

  Future<AuthResult> login(String phoneNumber, {String? code}) async {
    try {
      final response = await _authService.signIn({
        "identifier": phoneNumber,
        "userName": "",
        "verificationCode": code ?? "",
      });

      final rawCode = response.metaData?.responseCode?.toString();
      developer.log('AuthRepository: login responseCode: $rawCode');

      if (rawCode == '5211' || rawCode == '5270') {
        return AuthResult.otpSent;
      }

      if (rawCode == '202' || rawCode == '200') {
        return AuthResult.success;
      }
      return AuthResult.failure;
    } catch (e) {
      developer.log('AuthRepository: login error: $e');
      return AuthResult.failure;
    }
  }

  Future<AuthResult> verifyOtp(String phoneNumber, String otpCode) async {
    try {
      final response = await _authService.signIn({
        'identifier': phoneNumber,
        'verificationCode': otpCode,
        'userName': '',
      });

      final rawCode = response.metaData?.responseCode?.toString();
      developer.log('AuthRepository: verifyOtp rawCode: $rawCode');
      developer.log('AuthRepository: verifyOtp hasData: ${response.responseData != null}');

      if ((rawCode == '200' || rawCode == '202') && response.responseData != null) {
        final tokenData = TokenModel.fromJson(
          response.responseData as Map<String, dynamic>,
        );

        if (tokenData.accessToken != null && tokenData.refreshToken != null) {
          await SecureStorageManager.instance.saveTokens(
            accessToken: tokenData.accessToken!,
            refreshToken: tokenData.refreshToken!,
          );
          return AuthResult.success;
        }
      }
      return AuthResult.failure;
    } catch (e) {
      developer.log('AuthRepository: verifyOtp error: $e');
      return AuthResult.failure;
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref.watch(networkServiceProvider));
}
