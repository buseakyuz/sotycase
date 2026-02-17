import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotycase/product/constants/soty_colors.dart';
import '../providers/pending_transaction_provider.dart';
import '../models/pending_transaction_model.dart';

class PendingTransactionList extends ConsumerWidget {
  const PendingTransactionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingTransactions = ref.watch(pendingTransactionProvider);

    if (pendingTransactions.isEmpty) {
      return const _EmptyState();
    }
    return Column(
      children: [
        const _OnlineApprovalInfo(),
        Container(
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
            itemCount: pendingTransactions.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              indent: 70,
              endIndent: 16,
              color: Colors.grey.shade100,
            ),
            itemBuilder: (context, index) {
              return _PendingTransactionTile(
                transaction: pendingTransactions[index],
                isFirst: index == 0,
                isLast: index == pendingTransactions.length - 1,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _OnlineApprovalInfo extends StatelessWidget {
  const _OnlineApprovalInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Online Sepet Onaylama Süresi',
            style: TextStyle(fontSize: 13, color: Color(0xFF718096)),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.access_time, size: 16, color: SotyColors.primary),
              SizedBox(width: 6),
              Text(
                '30 Gün',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: SotyColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PendingTransactionTile extends StatefulWidget {
  final PendingTransactionModel transaction;
  final bool isFirst;
  final bool isLast;

  const _PendingTransactionTile({
    required this.transaction,
    required this.isFirst,
    required this.isLast,
  });

  @override
  State<_PendingTransactionTile> createState() =>
      _PendingTransactionTileState();
}

class _PendingTransactionTileState extends State<_PendingTransactionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFA0AEC0),
              size: 24,
            ),
          ),
          title: Row(
            children: [
              // ÇÖZÜM: Flexible veya Expanded kullanarak metnin taşmasını önle
              Flexible(
                child: Text(
                  widget.transaction.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF2D3748),
                  ),
                  overflow: TextOverflow.ellipsis, // Çok uzunsa '...' koyar
                  maxLines: 1,
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
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CountdownTimer(expiryDate: widget.transaction.expiryDate),
              Text(
                'Sipariş No: ${widget.transaction.orderNo}',
                style: const TextStyle(fontSize: 10, color: Color(0xFFCBD5E0)),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize:
                MainAxisSize.min, // Sağ tarafın genişliğini minimize et
            children: [
              Text(
                '+${widget.transaction.amount.toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFFED8936),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: const Color(0xFFCBD5E0),
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 70, right: 16, bottom: 16),
            child: Column(
              children: [
                _buildDetailRow('İlk Alışveriş Kazanımı', '+200'),
                _buildDetailRow(
                  'Bahar Coşkusuyla',
                  '+300',
                  subTitle: 'X Alışverişe Y Soty Coin',
                ),
                _buildDetailRow('Coin Yağmuru', '+100', subTitle: '% Coin'),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDetailRow(String title, String amount, {String? subTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              if (subTitle != null)
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFA0AEC0),
                  ),
                ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFFED8936),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountdownTimer extends StatefulWidget {
  final DateTime expiryDate;
  const _CountdownTimer({required this.expiryDate});

  @override
  State<_CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<_CountdownTimer> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateStr =
        "${widget.expiryDate.day}.${widget.expiryDate.month < 10 ? '0' : ''}${widget.expiryDate.month}.${widget.expiryDate.year}";
    return Text(
      'Tahmini Kalan Gün $dateStr',
      style: const TextStyle(fontSize: 11, color: Color(0xFFA0AEC0)),
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
          'Bekleyen işleminiz bulunmamaktadır.',
          style: TextStyle(color: Color(0xFFA0AEC0)),
        ),
      ),
    );
  }
}
