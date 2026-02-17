import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotycase/product/navigation/app_router.dart';
import 'package:sotycase/product/constants/product_constants.dart';
import 'package:sotycase/product/init/application_init.dart';
import 'package:sotycase/product/theme/theme_provider.dart';

Future<void> main() async {
  await ApplicationInit().make();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final currentTheme = ref.watch(themeProvider);

    return MaterialApp.router(
      title: ProductConstants.instance.appName,
      routerConfig: router,
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
