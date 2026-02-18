import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotycase/features/auth/providers/auth_state.dart';
import 'package:sotycase/features/auth/repository/auth_repository.dart';
import 'package:sotycase/product/providers/auth/auth_provider.dart';
import '../models/auth_result.dart';

part 'auth_notifier.g.dart';

@riverpod
class Auth extends _$Auth {
  Timer? _timer;

  @override
  AuthState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const AuthState();
  }

  void _startTimer() {
    _timer?.cancel();
    state = state.copyWith(remainingTime: 60);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingTime > 0) {
        state = state.copyWith(remainingTime: state.remainingTime - 1);
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<bool> sendCode(String phone) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await ref.read(authRepositoryProvider).login(phone);
      if (result == AuthResult.success || result == AuthResult.otpSent) {
        state = state.copyWith(isLoading: false, isCodeSent: true, errorMessage: null);
        _startTimer();
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Kod gönderilemedi.',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Bir hata oluştu.',
      );
      return false;
    }
  }

  Future<bool> verifyCode(String phone, String code) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      final result = await ref.read(authRepositoryProvider).verifyOtp(phone, code);
      
      if (result == AuthResult.success) {
        state = state.copyWith(isLoading: false);
        _timer?.cancel();
        // Update global authentication state
        await ref.read(authenticationProvider.notifier).verifyOtp(code);
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Doğrulama kodu hatalı.',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Bir hata oluştu.',
      );
      return false;
    }
  }

  void resendCode() {
    state = state.copyWith(isCodeSent: true, errorMessage: null);
    _startTimer();
  }
}
