import 'package:flutter/material.dart';
import 'package:sotycase/product/models/wallet/transaction_model.dart';

class TransactionHistoryList extends StatelessWidget {
  final List<WalletTransactionModel> transactions;

  const TransactionHistoryList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) return const _EmptyState();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          indent: 72,
          endIndent: 0,
          color: Colors.grey.shade100,
        ),
        itemBuilder: (context, index) {
          return _TransactionTile(
            transaction: transactions[index],
            isFirst: index == 0,
            isLast: index == transactions.length - 1,
          );
        },
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
    final amount = widget.transaction.coin ?? 0;
    final balance = widget.transaction.balance ?? 0;
    final isExpense = widget.transaction.type == 2;
    final isPositive = !isExpense;

    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Icon(
              _getIconForType(widget.transaction.typeName),
              color: const Color(0xFF718096),
              size: 24,
            ),
          ),
          title: Row(
            children: [
              Text(
                widget.transaction.typeName ?? 'İşlem',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.info_outline,
                size: 16,
                color: Color(0xFFCBD5E0),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              _formatDate(widget.transaction.date),
              style: const TextStyle(fontSize: 12, color: Color(0xFFA0AEC0)),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isPositive ? "+" : "-"}${amount.toInt()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isPositive
                          ? const Color(0xFF48BB78)
                          : const Color(0xFFF56565),
                    ),
                  ),
                  const SizedBox(height: 2),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFFA0AEC0),
                      ),
                      children: [
                        const TextSpan(text: 'Bakiye: '),
                        TextSpan(
                          text: balance.toInt().toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4A5568),
                          ),
                        ),
                      ],
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
                size: 24,
              ),
            ],
          ),
        ),
        if (_isExpanded) _buildExpandedDetail(),
      ],
    );
  }

  Widget _buildExpandedDetail() {
    final detail = widget.transaction.detail;
    if (detail == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 72, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (detail.transferParty != null)
            _detailRow('Transfer Edilen', detail.transferParty!),
          if (detail.orderNumber != null)
            _detailRow('Sipariş No', detail.orderNumber!),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForType(String? type) {
    switch (type) {
      case 'Kampanya':
        return Icons.local_offer_outlined;
      case 'Görev':
        return Icons.event_available_outlined;
      case 'Alışveriş':
        return Icons.shopping_bag_outlined;
      case 'İade':
        return Icons.keyboard_return_outlined;
      case 'Transfer':
        return Icons.swap_horiz_outlined;
      case 'Hediye':
        return Icons.card_giftcard_outlined;
      case 'Görev Silindi':
        return Icons.error_outline_outlined;
      default:
        return Icons.monetization_on_outlined;
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '';
    // API'den gelen ISO formatını basitçe görseldeki formata (Gün Ay Saat) benzetmek için
    return dateStr.split('T')[0].replaceAll('-', '.');
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
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
