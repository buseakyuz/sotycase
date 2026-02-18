// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

Object? _readResponseData(Map json, String key) => json['ResponseData'] ?? json['responseData'];
Object? _readMetaData(Map json, String key) => json['MetaData'] ?? json['metaData'];

@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @JsonKey(name: 'ResponseData', readValue: _readResponseData) T? responseData,
    @JsonKey(name: 'MetaData', readValue: _readMetaData) MetaData? metaData,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}

Object? _readMessage(Map json, String key) => json['Message'] ?? json['message'];
Object? _readResponseCode(Map json, String key) => json['ResponseCode'] ?? json['responseCode'];
Object? _readIsSuccess(Map json, String key) => json['IsSuccess'] ?? json['isSuccess'];

@freezed
abstract class MetaData with _$MetaData {
  const factory MetaData({
    @JsonKey(name: 'Message', readValue: _readMessage) String? message,
    @JsonKey(name: 'ResponseCode', readValue: _readResponseCode) dynamic responseCode,
    @JsonKey(name: 'IsSuccess', readValue: _readIsSuccess) bool? isSuccess,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);
}
