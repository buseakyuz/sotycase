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
}
