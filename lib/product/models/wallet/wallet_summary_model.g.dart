// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletSummaryModel _$WalletSummaryModelFromJson(Map<String, dynamic> json) =>
    _WalletSummaryModel(
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
      brandLogo: json['brandLogo'] as String?,
      walletLogo: json['walletLogo'] as String?,
      walletCover: json['walletCover'] as String?,
      totalAvailableCoin: (json['totalAvailableCoin'] as num?)?.toDouble(),
      totalAvailableTransferCoin: (json['totalAvailableTransferCoin'] as num?)
          ?.toDouble(),
      onlineCampaignCount: (json['onlineCampaignCount'] as num?)?.toInt(),
      storeCampaignCount: (json['storeCampaignCount'] as num?)?.toInt(),
      totalCampaignCount: (json['totalCampaignCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WalletSummaryModelToJson(_WalletSummaryModel instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'brandName': instance.brandName,
      'brandLogo': instance.brandLogo,
      'walletLogo': instance.walletLogo,
      'walletCover': instance.walletCover,
      'totalAvailableCoin': instance.totalAvailableCoin,
      'totalAvailableTransferCoin': instance.totalAvailableTransferCoin,
      'onlineCampaignCount': instance.onlineCampaignCount,
      'storeCampaignCount': instance.storeCampaignCount,
      'totalCampaignCount': instance.totalCampaignCount,
    };
