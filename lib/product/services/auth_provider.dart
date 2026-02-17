import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationNotifier extends _$AuthenticationNotifier {
  @override
  bool build() {
    return false;
  }

  Future<void> requestOtp(String phone) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<bool> verifyOtp(String code) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (code == "111111") {
      state = true;
      return true;
    }
    return false;
  }

  void logout() {
    state = false;
  }
}
