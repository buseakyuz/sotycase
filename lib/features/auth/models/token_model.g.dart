// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => _TokenModel(
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
  expiresIn: (json['expiresIn'] as num?)?.toInt(),
  refreshExpiresIn: (json['refreshExpiresIn'] as num?)?.toInt(),
  verificationCodeExpiresIn: (json['verificationCodeExpiresIn'] as num?)
      ?.toInt(),
);

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'refreshExpiresIn': instance.refreshExpiresIn,
      'verificationCodeExpiresIn': instance.verificationCodeExpiresIn,
    };
