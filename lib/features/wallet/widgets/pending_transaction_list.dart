import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: pendingTransactions.length,
          itemBuilder: (context, index) {
            return _PendingTransactionCard(
              transaction: pendingTransactions[index],
            );
          },
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.grey.shade600, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Online Sepet Onaylama Süresi: 30 Gün',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PendingTransactionCard extends StatelessWidget {
  final PendingTransactionModel transaction;

  const _PendingTransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/transaction-detail', extra: transaction),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.orange,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sipariş No: ${transaction.orderNo}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '+${transaction.amount.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kalan Süre',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF718096),
                  ),
                ),
                _CountdownTimer(expiryDate: transaction.expiryDate),
              ],
            ),
          ],
        ),
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
  late Duration _remainingDuration;

  @override
  void initState() {
    super.initState();
    _remainingDuration = widget.expiryDate.difference(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          _remainingDuration = widget.expiryDate.difference(DateTime.now());
        });
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
    if (_remainingDuration.isNegative) {
      return const Text('Süresi Doldu', style: TextStyle(color: Colors.red));
    }

    final days = _remainingDuration.inDays;
    final hours = _remainingDuration.inHours % 24;
    final minutes = _remainingDuration.inMinutes % 60;
    final seconds = _remainingDuration.inSeconds % 60;

    return Text(
      '${days}g ${hours}s ${minutes}d ${seconds}sn',
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: SotyColors.primary,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Text(
          'Bekleyen işleminiz bulunmamaktadır.',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}
