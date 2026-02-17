import 'package:flutter/material.dart';

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
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
        itemCount: _mockTransactions.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          indent: 70,
          endIndent: 16,
          color: Colors.grey.shade100,
        ),
        itemBuilder: (context, index) {
          return _TransactionTile(
            transaction: _mockTransactions[index],
            isFirst: index == 0,
            isLast: index == _mockTransactions.length - 1,
          );
        },
      ),
    );
  }
}

class _TransactionTile extends StatefulWidget {
  final TransactionModel transaction;
  final bool isFirst;
  final bool isLast;

  const _TransactionTile({
    required this.transaction,
    this.isFirst = false,
    this.isLast = false,
    super.key,
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
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.transaction.icon,
                color: const Color(0xFFA0AEC0),
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
                    color: Color(0xFF2D3748),
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
              style: const TextStyle(fontSize: 11, color: Color(0xFFA0AEC0)),
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
                        color: isPositive
                            ? const Color(0xFF48BB78)
                            : const Color(0xFFF56565),
                      ),
                    ),
                    Text(
                      'Bakiye: ${widget.transaction.balance}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF718096),
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

          // --- AYRINTI PANELİ (Tıklandığında Açılan Kısım) ---
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
                        color: Color(0xFF2D3748),
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
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    Text(
                      widget.transaction.description!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF718096),
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

class TransactionModel {
  final IconData icon;
  final String title;
  final String date;
  final int amount;
  final String balance;
  final String? brand;
  final String? descriptionTitle;
  final String? description;

  TransactionModel({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.balance,
    this.brand,
    this.descriptionTitle,
    this.description,
  });
}

final List<TransactionModel> _mockTransactions = [
  TransactionModel(
    icon: Icons.label_outline,
    title: 'Kampanya',
    date: 'Bugün 12:15',
    amount: 500,
    balance: '50.430',
    brand: 'Secil Store',
  ),
  TransactionModel(
    icon: Icons.error_outline,
    title: 'Görev Silindi',
    date: '16 Nisan 2025 12:32',
    amount: -500,
    balance: '50.700',
    descriptionTitle: 'Yıl Sonu Görevi',
    description: 'İçerik Oluşturma',
  ),
  TransactionModel(
    icon: Icons.card_giftcard_outlined,
    title: 'Hediye',
    date: '16 Nisan 2025 12:32',
    amount: 1000,
    balance: '50.700',
    brand: 'Secil Store',
  ),
  TransactionModel(
    icon: Icons.shopping_bag_outlined,
    title: 'Alışveriş',
    date: '21 Nisan 2025 10:40',
    amount: -600,
    balance: '49.780',
  ),
];
