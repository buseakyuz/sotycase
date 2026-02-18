// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_summary_model.freezed.dart';
part 'wallet_summary_model.g.dart';

@freezed
abstract class WalletSummaryModel with _$WalletSummaryModel {
  const factory WalletSummaryModel({
    @JsonKey(name: 'TotalBalance') double? totalBalance,
    @JsonKey(name: 'UsableBalance') double? usableBalance,
    @JsonKey(name: 'Currency') String? currency,
  }) = _WalletSummaryModel;

  factory WalletSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletSummaryModelFromJson(json);
}
