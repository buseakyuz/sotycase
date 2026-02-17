import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotycase/features/auth/providers/auth_state.dart';

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

  Future<void> sendCode(String phone) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    // Basic validation
    if (!phone.startsWith('5')) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Telefon numarası 5xx ile başlamalıdır.',
      );
      return;
    }
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(isLoading: false, isCodeSent: true);
    _startTimer();
  }

  Future<bool> verifyCode(String code) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    await Future.delayed(const Duration(seconds: 1));
    if (code == '111111') {
      state = state.copyWith(isLoading: false);
      _timer?.cancel();
      // Here you would also update the main AuthenticationNotifier
      return true;
    } else {
      state = state.copyWith(isLoading: false, errorMessage: 'Hatalı kod');
      return false;
    }
  }

  void resendCode() {
    state = state.copyWith(isCodeSent: true, errorMessage: null);
    _startTimer();
  }
}

