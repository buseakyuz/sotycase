// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletSummaryModel _$WalletSummaryModelFromJson(Map<String, dynamic> json) =>
    _WalletSummaryModel(
      totalBalance: (json['TotalBalance'] as num?)?.toDouble(),
      usableBalance: (json['UsableBalance'] as num?)?.toDouble(),
      currency: json['Currency'] as String?,
    );

Map<String, dynamic> _$WalletSummaryModelToJson(_WalletSummaryModel instance) =>
    <String, dynamic>{
      'TotalBalance': instance.totalBalance,
      'UsableBalance': instance.usableBalance,
      'Currency': instance.currency,
    };
