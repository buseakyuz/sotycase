import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotycase/features/auth/view/login_view.dart';
import 'package:sotycase/features/auth/view/otp_view.dart';
import 'package:sotycase/features/auth/view/welcome_view.dart';
import 'package:sotycase/features/wallet/view/wallet_view.dart';
import '../services/auth_provider.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final isAuthenticated = ref.watch(authenticationProvider);

  return GoRouter(
    initialLocation: '/welcome',
    redirect: (BuildContext context, GoRouterState state) {
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
      GoRoute(path: '/otp', builder: (context, state) => const OtpView()),
      GoRoute(path: '/wallet', builder: (context, state) => const WalletView()),
      GoRoute(
        path: '/store',
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Store View'))),
      ),
    ],
  );
}
