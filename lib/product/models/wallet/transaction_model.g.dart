// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletTransactionModel _$WalletTransactionModelFromJson(
  Map<String, dynamic> json,
) => _WalletTransactionModel(
  type: (json['type'] as num?)?.toInt(),
  typeName: json['typeName'] as String?,
  transactionType: (json['transactionType'] as num?)?.toInt(),
  transactionTypeName: json['transactionTypeName'] as String?,
  date: json['date'] as String?,
  coin: (json['coin'] as num?)?.toDouble(),
  balance: (json['balance'] as num?)?.toDouble(),
  detail: json['detail'] == null
      ? null
      : TransactionDetail.fromJson(json['detail'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WalletTransactionModelToJson(
  _WalletTransactionModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'typeName': instance.typeName,
  'transactionType': instance.transactionType,
  'transactionTypeName': instance.transactionTypeName,
  'date': instance.date,
  'coin': instance.coin,
  'balance': instance.balance,
  'detail': instance.detail,
};

_TransactionDetail _$TransactionDetailFromJson(Map<String, dynamic> json) =>
    _TransactionDetail(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      orderNumber: json['orderNumber'] as String?,
      transferParty: json['transferParty'] as String?,
    );

Map<String, dynamic> _$TransactionDetailToJson(_TransactionDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'orderNumber': instance.orderNumber,
      'transferParty': instance.transferParty,
    };
