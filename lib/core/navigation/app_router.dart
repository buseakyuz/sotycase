import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotycase/features/auth/view/login_view.dart';
import 'package:sotycase/features/auth/view/welcome_view.dart';
import '../../product/services/auth_provider.dart';

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
    ],
  );
}
