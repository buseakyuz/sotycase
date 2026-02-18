import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotycase/product/models/wallet/transaction_model.dart';
import '../widgets/wallet_app_bar.dart';
import '../widgets/loyalty_card_stack.dart';
import '../widgets/quick_action_buttons.dart';
import '../widgets/loyalty_status_card.dart';
import '../widgets/transaction_tabs.dart';
import '../widgets/transaction_history_list.dart';
import '../widgets/pending_transaction_list.dart';
import '../repository/wallet_repository.dart';

class WalletView extends ConsumerStatefulWidget {
  const WalletView({super.key});

  @override
  ConsumerState<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends ConsumerState<WalletView> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final walletSummary = ref.watch(walletSummaryProvider());
    final transactions = ref.watch(transactionsProvider());

    return Scaffold(
      appBar: const WalletAppBar(),
      body: walletSummary.when(
        data: (summary) => transactions.when(
          data: (transactionList) => RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(walletSummaryProvider());
              ref.invalidate(transactionsProvider());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  LoyaltyCardStack(summary: summary),
                  QuickActionButtons(summary: summary),
                  LoyaltyStatusCard(summary: summary),
                  TransactionTabs(
                    onChanged: (index) {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                  ),
                  _buildSelectedList(transactionList ?? []),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Hata: $err')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Hata: $err')),
      ),
    );
  }

  Widget _buildSelectedList(List<WalletTransactionModel> transactionList) {
    switch (_selectedTab) {
      case 1: // Bekleyen
        return const PendingTransactionList();
      default:
        return TransactionHistoryList(
          selectedIndex: _selectedTab,
          transactions: transactionList,
        );
    }
  }
}
