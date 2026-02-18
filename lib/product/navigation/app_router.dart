import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotycase/features/auth/view/login_view.dart';
import 'package:sotycase/features/auth/view/otp_view.dart';
import 'package:sotycase/features/auth/view/welcome_view.dart';
import 'package:sotycase/features/base/view/base_view.dart';
import 'package:sotycase/features/store/view/payment_view.dart';
import 'package:sotycase/features/store/view/store_view.dart';
import '../providers/auth/auth_provider.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authenticationProvider);

  return GoRouter(
    initialLocation: '/welcome',
    redirect: (BuildContext context, GoRouterState state) {
      if (authState.isLoading) return null;

      final isAuthenticated = authState.value ?? false;

      final isLoggingIn =
          state.matchedLocation == '/welcome' ||
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/otp';

      if (!isAuthenticated && !isLoggingIn) {
        return '/welcome';
      }

      if (isAuthenticated && isLoggingIn) {
        return '/wallet';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginView()),
      GoRoute(
        path: '/otp',
        builder: (context, state) {
          final phone = state.extra as String? ?? '';
          return OtpView(phone: phone);
        },
      ),
      GoRoute(path: '/wallet', builder: (context, state) => const BaseView()),
      GoRoute(path: '/store', builder: (context, state) => const StoreView()),
      GoRoute(
        path: '/payment',
        builder: (context, state) => const PaymentView(),
      ),
    ],
  );
}
