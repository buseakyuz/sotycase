import 'package:flutter/material.dart';
import '../widgets/wallet_app_bar.dart';
import '../widgets/loyalty_card_stack.dart';
import '../widgets/quick_action_buttons.dart';
import '../widgets/loyalty_status_card.dart';
import '../widgets/transaction_tabs.dart';
import '../widgets/transaction_history_list.dart';
import '../widgets/pending_transaction_list.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: const WalletAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const LoyaltyCardStack(),
            const QuickActionButtons(),
            const LoyaltyStatusCard(),
            TransactionTabs(
              onChanged: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
            ),
            _buildSelectedList(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedList() {
    switch (_selectedTab) {
      case 1: // Bekleyen
        return const PendingTransactionList();
      default:
        return const TransactionHistoryList();
    }
  }
}
