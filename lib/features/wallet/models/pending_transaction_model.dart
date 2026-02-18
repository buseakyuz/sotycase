import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_transaction_model.freezed.dart';
part 'pending_transaction_model.g.dart';

@freezed
abstract class PendingTransactionModel with _$PendingTransactionModel {
  const factory PendingTransactionModel({
    required String id,
    required String title,
    required double amount,
    required DateTime expiryDate,
    required String orderNo,
  }) = _PendingTransactionModel;

  factory PendingTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$PendingTransactionModelFromJson(json);

  static List<PendingTransactionModel> get mockPendingTransactions => [
        PendingTransactionModel(
          id: '1',
          title: 'Online Alışveriş Onayı',
          amount: 1250.0,
          expiryDate: DateTime.now().add(const Duration(
              days: 29, hours: 23, minutes: 59, seconds: 59)),
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
