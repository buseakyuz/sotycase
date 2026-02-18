// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BaseResponse<T> with _$BaseResponse<T> {
  const factory BaseResponse({
    @JsonKey(name: 'ResponseData') T? responseData,
    @JsonKey(name: 'MetaData') MetaData? metaData,
  }) = _BaseResponse<T>;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@freezed
abstract class MetaData with _$MetaData {
  const factory MetaData({
    @JsonKey(name: 'Message') String? message,
    @JsonKey(name: 'ResponseCode') dynamic responseCode,
    @JsonKey(name: 'IsSuccess') bool? isSuccess,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}
