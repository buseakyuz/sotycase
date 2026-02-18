import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../cache/secure_storage_manager.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationNotifier extends _$AuthenticationNotifier {
  @override
  Future<bool> build() async {
    final token = await SecureStorageManager.instance.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> setAuthenticated(bool value) async {
    state = AsyncData(value);
  }

  Future<bool> verifyOtp(String code) async {
    state = const AsyncData(true);
    return true;
  }

  Future<void> logout() async {
    await SecureStorageManager.instance.deleteAllTokens();
    state = const AsyncData(false);
  }
}
