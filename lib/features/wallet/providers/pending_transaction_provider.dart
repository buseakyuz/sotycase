import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/pending_transaction_model.dart';

part 'pending_transaction_provider.g.dart';

@riverpod
class PendingTransaction extends _$PendingTransaction {
  Timer? _timer;

  @override
  List<PendingTransactionModel> build() {
    _startExpiryTimer();
    ref.onDispose(() => _timer?.cancel());

    // Mock initial data
    return [
      PendingTransactionModel(
        id: '1',
        title: 'Online Alışveriş Onayı',
        amount: 1250.0,
        expiryDate: DateTime.now().add(const Duration(days: 29, hours: 23, minutes: 59, seconds: 59)),
        orderNo: 'ORD-123456',
      ),
      PendingTransactionModel(
        id: '2',
        title: 'Mağaza Alışverişi Beklemede',
        amount: 450.0,
        expiryDate: DateTime.now().add(const Duration(minutes: 5)),
        orderNo: 'ORD-789012',
      ),
    ];
  }

  void _startExpiryTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final currentList = state;
      final filteredList = currentList.where((item) => item.expiryDate.isAfter(now)).toList();

      if (filteredList.length != currentList.length) {
        state = filteredList;
      }
    });
  }

  void removeTransaction(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}
