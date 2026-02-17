// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PendingTransactionModel _$PendingTransactionModelFromJson(
  Map<String, dynamic> json,
) => _PendingTransactionModel(
  id: json['id'] as String,
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  expiryDate: DateTime.parse(json['expiryDate'] as String),
  orderNo: json['orderNo'] as String,
);

Map<String, dynamic> _$PendingTransactionModelToJson(
  _PendingTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'amount': instance.amount,
  'expiryDate': instance.expiryDate.toIso8601String(),
  'orderNo': instance.orderNo,
};
