import 'package:flutter/material.dart';
import 'package:sotycase/product/constants/soty_colors.dart';

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: 10,
      itemBuilder: (context, index) {
        final isGain = index % 2 == 0;
        return _TransactionItem(
          icon: isGain ? Icons.card_giftcard : Icons.shopping_bag_outlined,
          title: isGain ? 'Hediye Coin Kazandın' : 'Online Harcama',
          date: '17 Şubat 2024, 21:41',
          amount: isGain ? '+500' : '-1.200',
          balance: '50.000',
          isGain: isGain,
        );
      },
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final String balance;
  final bool isGain;

  const _TransactionItem({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.balance,
    required this.isGain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: (isGain ? Colors.green : SotyColors.primary).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: isGain ? Colors.green : SotyColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: SotyColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isGain ? Colors.green : SotyColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$balance Coin',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
