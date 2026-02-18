// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseResponse<T> {

@JsonKey(name: 'ResponseData', readValue: _readResponseData) T? get responseData;@JsonKey(name: 'MetaData', readValue: _readMetaData) MetaData? get metaData;
/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseResponseCopyWith<T, BaseResponse<T>> get copyWith => _$BaseResponseCopyWithImpl<T, BaseResponse<T>>(this as BaseResponse<T>, _$identity);

  /// Serializes this BaseResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseResponse<T>&&const DeepCollectionEquality().equals(other.responseData, responseData)&&(identical(other.metaData, metaData) || other.metaData == metaData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(responseData),metaData);

@override
String toString() {
  return 'BaseResponse<$T>(responseData: $responseData, metaData: $metaData)';
}


}

/// @nodoc
abstract mixin class $BaseResponseCopyWith<T,$Res>  {
  factory $BaseResponseCopyWith(BaseResponse<T> value, $Res Function(BaseResponse<T>) _then) = _$BaseResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ResponseData', readValue: _readResponseData) T? responseData,@JsonKey(name: 'MetaData', readValue: _readMetaData) MetaData? metaData
});


$MetaDataCopyWith<$Res>? get metaData;

}
/// @nodoc
class _$BaseResponseCopyWithImpl<T,$Res>
    implements $BaseResponseCopyWith<T, $Res> {
  _$BaseResponseCopyWithImpl(this._self, this._then);

  final BaseResponse<T> _self;
  final $Res Function(BaseResponse<T>) _then;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? responseData = freezed,Object? metaData = freezed,}) {
  return _then(_self.copyWith(
responseData: freezed == responseData ? _self.responseData : responseData // ignore: cast_nullable_to_non_nullable
as T?,metaData: freezed == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as MetaData?,
  ));
}
/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDataCopyWith<$Res>? get metaData {
    if (_self.metaData == null) {
    return null;
  }

  return $MetaDataCopyWith<$Res>(_self.metaData!, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}


/// Adds pattern-matching-related methods to [BaseResponse].
extension BaseResponsePatterns<T> on BaseResponse<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _BaseResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ResponseData', readValue: _readResponseData)  T? responseData, @JsonKey(name: 'MetaData', readValue: _readMetaData)  MetaData? metaData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that.responseData,_that.metaData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ResponseData', readValue: _readResponseData)  T? responseData, @JsonKey(name: 'MetaData', readValue: _readMetaData)  MetaData? metaData)  $default,) {final _that = this;
switch (_that) {
case _BaseResponse():
return $default(_that.responseData,_that.metaData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ResponseData', readValue: _readResponseData)  T? responseData, @JsonKey(name: 'MetaData', readValue: _readMetaData)  MetaData? metaData)?  $default,) {final _that = this;
switch (_that) {
case _BaseResponse() when $default != null:
return $default(_that.responseData,_that.metaData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseResponse<T> implements BaseResponse<T> {
  const _BaseResponse({@JsonKey(name: 'ResponseData', readValue: _readResponseData) this.responseData, @JsonKey(name: 'MetaData', readValue: _readMetaData) this.metaData});
  factory _BaseResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseResponseFromJson(json,fromJsonT);

@override@JsonKey(name: 'ResponseData', readValue: _readResponseData) final  T? responseData;
@override@JsonKey(name: 'MetaData', readValue: _readMetaData) final  MetaData? metaData;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseResponseCopyWith<T, _BaseResponse<T>> get copyWith => __$BaseResponseCopyWithImpl<T, _BaseResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BaseResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseResponse<T>&&const DeepCollectionEquality().equals(other.responseData, responseData)&&(identical(other.metaData, metaData) || other.metaData == metaData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(responseData),metaData);

@override
String toString() {
  return 'BaseResponse<$T>(responseData: $responseData, metaData: $metaData)';
}


}

/// @nodoc
abstract mixin class _$BaseResponseCopyWith<T,$Res> implements $BaseResponseCopyWith<T, $Res> {
  factory _$BaseResponseCopyWith(_BaseResponse<T> value, $Res Function(_BaseResponse<T>) _then) = __$BaseResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ResponseData', readValue: _readResponseData) T? responseData,@JsonKey(name: 'MetaData', readValue: _readMetaData) MetaData? metaData
});


@override $MetaDataCopyWith<$Res>? get metaData;

}
/// @nodoc
class __$BaseResponseCopyWithImpl<T,$Res>
    implements _$BaseResponseCopyWith<T, $Res> {
  __$BaseResponseCopyWithImpl(this._self, this._then);

  final _BaseResponse<T> _self;
  final $Res Function(_BaseResponse<T>) _then;

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? responseData = freezed,Object? metaData = freezed,}) {
  return _then(_BaseResponse<T>(
responseData: freezed == responseData ? _self.responseData : responseData // ignore: cast_nullable_to_non_nullable
as T?,metaData: freezed == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as MetaData?,
  ));
}

/// Create a copy of BaseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDataCopyWith<$Res>? get metaData {
    if (_self.metaData == null) {
    return null;
  }

  return $MetaDataCopyWith<$Res>(_self.metaData!, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}


/// @nodoc
mixin _$MetaData {

@JsonKey(name: 'Message', readValue: _readMessage) String? get message;@JsonKey(name: 'ResponseCode', readValue: _readResponseCode) dynamic get responseCode;@JsonKey(name: 'IsSuccess', readValue: _readIsSuccess) bool? get isSuccess;
/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaDataCopyWith<MetaData> get copyWith => _$MetaDataCopyWithImpl<MetaData>(this as MetaData, _$identity);

  /// Serializes this MetaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaData&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.responseCode, responseCode)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(responseCode),isSuccess);

@override
String toString() {
  return 'MetaData(message: $message, responseCode: $responseCode, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $MetaDataCopyWith<$Res>  {
  factory $MetaDataCopyWith(MetaData value, $Res Function(MetaData) _then) = _$MetaDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Message', readValue: _readMessage) String? message,@JsonKey(name: 'ResponseCode', readValue: _readResponseCode) dynamic responseCode,@JsonKey(name: 'IsSuccess', readValue: _readIsSuccess) bool? isSuccess
});




}
/// @nodoc
class _$MetaDataCopyWithImpl<$Res>
    implements $MetaDataCopyWith<$Res> {
  _$MetaDataCopyWithImpl(this._self, this._then);

  final MetaData _self;
  final $Res Function(MetaData) _then;

/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? responseCode = freezed,Object? isSuccess = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,responseCode: freezed == responseCode ? _self.responseCode : responseCode // ignore: cast_nullable_to_non_nullable
as dynamic,isSuccess: freezed == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaData].
extension MetaDataPatterns on MetaData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaData value)  $default,){
final _that = this;
switch (_that) {
case _MetaData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaData value)?  $default,){
final _that = this;
switch (_that) {
case _MetaData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Message', readValue: _readMessage)  String? message, @JsonKey(name: 'ResponseCode', readValue: _readResponseCode)  dynamic responseCode, @JsonKey(name: 'IsSuccess', readValue: _readIsSuccess)  bool? isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaData() when $default != null:
return $default(_that.message,_that.responseCode,_that.isSuccess);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Message', readValue: _readMessage)  String? message, @JsonKey(name: 'ResponseCode', readValue: _readResponseCode)  dynamic responseCode, @JsonKey(name: 'IsSuccess', readValue: _readIsSuccess)  bool? isSuccess)  $default,) {final _that = this;
switch (_that) {
case _MetaData():
return $default(_that.message,_that.responseCode,_that.isSuccess);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Message', readValue: _readMessage)  String? message, @JsonKey(name: 'ResponseCode', readValue: _readResponseCode)  dynamic responseCode, @JsonKey(name: 'IsSuccess', readValue: _readIsSuccess)  bool? isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _MetaData() when $default != null:
return $default(_that.message,_that.responseCode,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaData implements MetaData {
  const _MetaData({@JsonKey(name: 'Message', readValue: _readMessage) this.message, @JsonKey(name: 'ResponseCode', readValue: _readResponseCode) this.responseCode, @JsonKey(name: 'IsSuccess', readValue: _readIsSuccess) this.isSuccess});
  factory _MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);

@override@JsonKey(name: 'Message', readValue: _readMessage) final  String? message;
@override@JsonKey(name: 'ResponseCode', readValue: _readResponseCode) final  dynamic responseCode;
@override@JsonKey(name: 'IsSuccess', readValue: _readIsSuccess) final  bool? isSuccess;

/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaDataCopyWith<_MetaData> get copyWith => __$MetaDataCopyWithImpl<_MetaData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaData&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.responseCode, responseCode)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(responseCode),isSuccess);

@override
String toString() {
  return 'MetaData(message: $message, responseCode: $responseCode, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$MetaDataCopyWith<$Res> implements $MetaDataCopyWith<$Res> {
  factory _$MetaDataCopyWith(_MetaData value, $Res Function(_MetaData) _then) = __$MetaDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Message', readValue: _readMessage) String? message,@JsonKey(name: 'ResponseCode', readValue: _readResponseCode) dynamic responseCode,@JsonKey(name: 'IsSuccess', readValue: _readIsSuccess) bool? isSuccess
});




}
/// @nodoc
class __$MetaDataCopyWithImpl<$Res>
    implements _$MetaDataCopyWith<$Res> {
  __$MetaDataCopyWithImpl(this._self, this._then);

  final _MetaData _self;
  final $Res Function(_MetaData) _then;

/// Create a copy of MetaData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? responseCode = freezed,Object? isSuccess = freezed,}) {
  return _then(_MetaData(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,responseCode: freezed == responseCode ? _self.responseCode : responseCode // ignore: cast_nullable_to_non_nullable
as dynamic,isSuccess: freezed == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
