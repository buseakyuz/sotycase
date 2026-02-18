import 'package:flutter/material.dart';
import '../../../../product/constants/soty_colors.dart';
import '../models/transaction_history_model.dart';

class TransactionHistoryList extends StatelessWidget {
  final int selectedIndex;
  const TransactionHistoryList({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    final filteredTransactions =
        TransactionHistoryModel.mockTransactions.where((t) {
      if (selectedIndex == 2) return t.amount > 0; // Kazandıklarım
      if (selectedIndex == 3) return t.amount < 0; // Harcadıklarım
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
  final TransactionHistoryModel transaction;
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
    final isPositive = widget.transaction.amount > 0;

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
                widget.transaction.icon,
                color: SotyColors.gray,
                size: 24,
              ),
            ),
            title: Row(
              children: [
                Text(
                  widget.transaction.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: SotyColors.textPrimary,
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
              widget.transaction.date,
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
                      '${isPositive ? "+" : ""}${widget.transaction.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color:
                            isPositive ? SotyColors.success : SotyColors.error,
                      ),
                    ),
                    Text(
                      'Bakiye: ${widget.transaction.balance}',
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
                  if (widget.transaction.brand != null) ...[
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
                      widget.transaction.brand!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: SotyColors.textPrimary,
                      ),
                    ),
                  ],
                  if (widget.transaction.description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      widget.transaction.descriptionTitle ?? 'Detay',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: SotyColors.textPrimary,
                      ),
                    ),
                    Text(
                      widget.transaction.description!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: SotyColors.textSecondary,
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
}
