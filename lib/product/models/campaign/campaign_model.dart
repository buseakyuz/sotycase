// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_model.freezed.dart';
part 'campaign_model.g.dart';

@freezed
abstract class CampaignModel with _$CampaignModel {
  const factory CampaignModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'brandName') required String brandName,
    @JsonKey(name: 'brandLogo') String? brandLogo,
    @JsonKey(name: 'endDate') required String endDate,
    @JsonKey(name: 'isCombinable') @Default(false) bool isCombinable,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'brandId') String? brandId,
  }) = _CampaignModel;

  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);
}
