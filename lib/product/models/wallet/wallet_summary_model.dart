// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_summary_model.freezed.dart';
part 'wallet_summary_model.g.dart';

@freezed
abstract class WalletSummaryModel with _$WalletSummaryModel {
  const WalletSummaryModel._();

  const factory WalletSummaryModel({
    @JsonKey(name: 'brandId') String? brandId,
    @JsonKey(name: 'brandName') String? brandName,
    @JsonKey(name: 'brandLogo') String? brandLogo,
    @JsonKey(name: 'walletLogo') String? walletLogo,
    @JsonKey(name: 'walletCover') String? walletCover,
    @JsonKey(name: 'totalAvailableCoin') double? totalAvailableCoin,
    @JsonKey(name: 'totalAvailableTransferCoin')
    double? totalAvailableTransferCoin,
    @JsonKey(name: 'onlineCampaignCount') int? onlineCampaignCount,
    @JsonKey(name: 'storeCampaignCount') int? storeCampaignCount,
    @JsonKey(name: 'totalCampaignCount') int? totalCampaignCount,
  }) = _WalletSummaryModel;

  factory WalletSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletSummaryModelFromJson(json);

  double get totalBalance => totalAvailableCoin ?? 0;
  double get usableBalance => totalAvailableTransferCoin ?? 0;
}
