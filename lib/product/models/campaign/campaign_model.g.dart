// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    _CampaignModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
      brandName: json['brandName'] as String,
      brandLogo: json['brandLogo'] as String?,
      endDate: json['endDate'] as String,
      isCombinable: json['isCombinable'] as bool? ?? false,
      status: (json['status'] as num?)?.toInt(),
      brandId: json['brandId'] as String?,
    );

Map<String, dynamic> _$CampaignModelToJson(_CampaignModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'brandName': instance.brandName,
      'brandLogo': instance.brandLogo,
      'endDate': instance.endDate,
      'isCombinable': instance.isCombinable,
      'status': instance.status,
      'brandId': instance.brandId,
    };
