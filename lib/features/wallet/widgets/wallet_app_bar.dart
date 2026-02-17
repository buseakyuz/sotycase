import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sotycase/product/constants/soty_colors.dart';

class WalletAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WalletAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: SotyColors.textPrimary),
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/welcome');
          }
        },
      ),
      title: const Text(
        'Cüzdanım',
        style: TextStyle(
          color: SotyColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.qr_code_scanner, color: SotyColors.textPrimary),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: SotyColors.textPrimary),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
