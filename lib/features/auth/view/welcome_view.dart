import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sotycase/product/constants/soty_colors.dart';
import 'package:sotycase/core/constants/layout_constants.dart';
import 'package:sotycase/features/global/widget/button/custom_rectangle_button.dart';
import '../widget/soty_wave_background.dart';

class WelcomeView extends ConsumerWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const SotyWaveBackground(),
          SafeArea(
            child: Padding(
              padding: LayoutConstants.highAllPadding,
              child: Column(
                children: [
                  Spacer(flex: 2),
                  Image.asset("assets/logo/sotylogo.png", height: 200),
                  Spacer(flex: 1),
                  CustomRectangleButton(
                    text: "Giriş Yap",
                    onTap: () => context.push('/login'),
                    borderColor: SotyColors.primary,
                  ),
                  Spacer(flex: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
