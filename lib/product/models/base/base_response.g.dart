// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _BaseResponse<T>(
  responseData: _$nullableGenericFromJson(json['ResponseData'], fromJsonT),
  metaData: json['MetaData'] == null
      ? null
      : MetaData.fromJson(json['MetaData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BaseResponseToJson<T>(
  _BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'ResponseData': _$nullableGenericToJson(instance.responseData, toJsonT),
  'MetaData': instance.metaData,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_MetaData _$MetaDataFromJson(Map<String, dynamic> json) => _MetaData(
  message: json['Message'] as String?,
  responseCode: json['ResponseCode'],
  isSuccess: json['IsSuccess'] as bool?,
);

Map<String, dynamic> _$MetaDataToJson(_MetaData instance) => <String, dynamic>{
  'Message': instance.message,
  'ResponseCode': instance.responseCode,
  'IsSuccess': instance.isSuccess,
};
