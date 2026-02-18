// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletTransactionModel _$WalletTransactionModelFromJson(
  Map<String, dynamic> json,
) => _WalletTransactionModel(
  amount: (json['Amount'] as num?)?.toDouble(),
  title: json['Title'] as String?,
  orderNo: json['OrderNo'] as String?,
  transactionDate: json['TransactionDate'] as String?,
  transactionType: json['TransactionType'] as String?,
  brandName: json['BrandName'] as String?,
);

Map<String, dynamic> _$WalletTransactionModelToJson(
  _WalletTransactionModel instance,
) => <String, dynamic>{
  'Amount': instance.amount,
  'Title': instance.title,
  'OrderNo': instance.orderNo,
  'TransactionDate': instance.transactionDate,
  'TransactionType': instance.transactionType,
  'BrandName': instance.brandName,
};
