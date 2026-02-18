import 'package:flutter/material.dart';
import 'package:sotycase/product/models/wallet/transaction_model.dart';
import '../../../../product/constants/soty_colors.dart';

class TransactionHistoryList extends StatelessWidget {
  final int selectedIndex;
  final List<WalletTransactionModel> transactions;
  
  const TransactionHistoryList({
    super.key, 
    required this.selectedIndex,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = transactions.where((t) {
      if (selectedIndex == 2) return (t.amount ?? 0) > 0; // Kazandıklarım
      if (selectedIndex == 3) return (t.amount ?? 0) < 0; // Harcadıklarım
      return true; // Tümü
    }).toList();

    if (filteredTransactions.isEmpty) {
      return const _EmptyState();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: filteredTransactions.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          indent: 70,
          endIndent: 16,
          color: Colors.grey.shade100,
        ),
        itemBuilder: (context, index) {
          return _TransactionTile(
            transaction: filteredTransactions[index],
            isFirst: index == 0,
            isLast: index == filteredTransactions.length - 1,
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Text(
          'İşlem bulunmamaktadır.',
          style: TextStyle(color: SotyColors.gray),
        ),
      ),
    );
  }
}

class _TransactionTile extends StatefulWidget {
  final WalletTransactionModel transaction;
  final bool isFirst;
  final bool isLast;

  const _TransactionTile({
    required this.transaction,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  State<_TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<_TransactionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final amount = widget.transaction.amount ?? 0;
    final isPositive = amount > 0;

    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: widget.isFirst ? const Radius.circular(16) : Radius.zero,
        bottom: widget.isLast ? const Radius.circular(16) : Radius.zero,
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: SotyColors.lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getIconForType(widget.transaction.transactionType),
                color: SotyColors.gray,
                size: 24,
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.transaction.title ?? 'İşlem',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: SotyColors.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.info_outline,
                  size: 14,
                  color: Color(0xFFCBD5E0),
                ),
              ],
            ),
            subtitle: Text(
              widget.transaction.transactionDate ?? '',
              style: const TextStyle(fontSize: 11, color: SotyColors.gray),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${isPositive ? "+" : ""}${amount.toInt()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color:
                            isPositive ? SotyColors.success : SotyColors.error,
                      ),
                    ),
                    if (widget.transaction.orderNo != null)
                      Text(
                        'No: ${widget.transaction.orderNo}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: SotyColors.textSecondary,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: const Color(0xFFCBD5E0),
                  size: 20,
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 70, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.grey.shade50),
                  if (widget.transaction.brandName != null) ...[
                    const Text(
                      'Marka',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.transaction.brandName!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: SotyColors.textPrimary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  IconData _getIconForType(String? type) {
    switch (type?.toLowerCase()) {
      case 'shopping':
        return Icons.shopping_bag_outlined;
      case 'campaign':
        return Icons.label_outline;
      case 'gift':
        return Icons.card_giftcard_outlined;
      default:
        return Icons.monetization_on_outlined;
    }
  }
}
