import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isCodeSent,
    String? errorMessage,
    @Default(60) int remainingTime,
  }) = _AuthState;
}
