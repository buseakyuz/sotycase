import 'package:flutter/material.dart';
import 'package:sotycase/product/constants/soty_colors.dart';
import '../widgets/wallet_app_bar.dart';
import '../widgets/loyalty_card_stack.dart';
import '../widgets/quick_action_buttons.dart';
import '../widgets/loyalty_status_card.dart';
import '../widgets/transaction_tabs.dart';
import '../widgets/transaction_history_list.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: const WalletAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 12),
            LoyaltyCardStack(),
            QuickActionButtons(),
            LoyaltyStatusCard(),
            TransactionTabs(),
            TransactionHistoryList(),
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2, // Wallet is the center and active
        selectedItemColor: SotyColors.primary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flash_on_outlined), label: 'Akış'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Görev'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Cüzdan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: 'Kampanya'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}
