// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaign_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampaignModel {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String get description;@JsonKey(name: 'image') String? get image;@JsonKey(name: 'brandName') String get brandName;@JsonKey(name: 'brandLogo') String? get brandLogo;@JsonKey(name: 'endDate') String get endDate;@JsonKey(name: 'isCombinable') bool get isCombinable;@JsonKey(name: 'status') int? get status;@JsonKey(name: 'brandId') String? get brandId;
/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignModelCopyWith<CampaignModel> get copyWith => _$CampaignModelCopyWithImpl<CampaignModel>(this as CampaignModel, _$identity);

  /// Serializes this CampaignModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.brandLogo, brandLogo) || other.brandLogo == brandLogo)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCombinable, isCombinable) || other.isCombinable == isCombinable)&&(identical(other.status, status) || other.status == status)&&(identical(other.brandId, brandId) || other.brandId == brandId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,image,brandName,brandLogo,endDate,isCombinable,status,brandId);

@override
String toString() {
  return 'CampaignModel(id: $id, name: $name, description: $description, image: $image, brandName: $brandName, brandLogo: $brandLogo, endDate: $endDate, isCombinable: $isCombinable, status: $status, brandId: $brandId)';
}


}

/// @nodoc
abstract mixin class $CampaignModelCopyWith<$Res>  {
  factory $CampaignModelCopyWith(CampaignModel value, $Res Function(CampaignModel) _then) = _$CampaignModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'image') String? image,@JsonKey(name: 'brandName') String brandName,@JsonKey(name: 'brandLogo') String? brandLogo,@JsonKey(name: 'endDate') String endDate,@JsonKey(name: 'isCombinable') bool isCombinable,@JsonKey(name: 'status') int? status,@JsonKey(name: 'brandId') String? brandId
});




}
/// @nodoc
class _$CampaignModelCopyWithImpl<$Res>
    implements $CampaignModelCopyWith<$Res> {
  _$CampaignModelCopyWithImpl(this._self, this._then);

  final CampaignModel _self;
  final $Res Function(CampaignModel) _then;

/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? image = freezed,Object? brandName = null,Object? brandLogo = freezed,Object? endDate = null,Object? isCombinable = null,Object? status = freezed,Object? brandId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,brandLogo: freezed == brandLogo ? _self.brandLogo : brandLogo // ignore: cast_nullable_to_non_nullable
as String?,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,isCombinable: null == isCombinable ? _self.isCombinable : isCombinable // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CampaignModel].
extension CampaignModelPatterns on CampaignModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampaignModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampaignModel value)  $default,){
final _that = this;
switch (_that) {
case _CampaignModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampaignModel value)?  $default,){
final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'brandName')  String brandName, @JsonKey(name: 'brandLogo')  String? brandLogo, @JsonKey(name: 'endDate')  String endDate, @JsonKey(name: 'isCombinable')  bool isCombinable, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'brandId')  String? brandId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.image,_that.brandName,_that.brandLogo,_that.endDate,_that.isCombinable,_that.status,_that.brandId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'brandName')  String brandName, @JsonKey(name: 'brandLogo')  String? brandLogo, @JsonKey(name: 'endDate')  String endDate, @JsonKey(name: 'isCombinable')  bool isCombinable, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'brandId')  String? brandId)  $default,) {final _that = this;
switch (_that) {
case _CampaignModel():
return $default(_that.id,_that.name,_that.description,_that.image,_that.brandName,_that.brandLogo,_that.endDate,_that.isCombinable,_that.status,_that.brandId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String description, @JsonKey(name: 'image')  String? image, @JsonKey(name: 'brandName')  String brandName, @JsonKey(name: 'brandLogo')  String? brandLogo, @JsonKey(name: 'endDate')  String endDate, @JsonKey(name: 'isCombinable')  bool isCombinable, @JsonKey(name: 'status')  int? status, @JsonKey(name: 'brandId')  String? brandId)?  $default,) {final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.image,_that.brandName,_that.brandLogo,_that.endDate,_that.isCombinable,_that.status,_that.brandId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampaignModel implements CampaignModel {
  const _CampaignModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'image') this.image, @JsonKey(name: 'brandName') required this.brandName, @JsonKey(name: 'brandLogo') this.brandLogo, @JsonKey(name: 'endDate') required this.endDate, @JsonKey(name: 'isCombinable') this.isCombinable = false, @JsonKey(name: 'status') this.status, @JsonKey(name: 'brandId') this.brandId});
  factory _CampaignModel.fromJson(Map<String, dynamic> json) => _$CampaignModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'image') final  String? image;
@override@JsonKey(name: 'brandName') final  String brandName;
@override@JsonKey(name: 'brandLogo') final  String? brandLogo;
@override@JsonKey(name: 'endDate') final  String endDate;
@override@JsonKey(name: 'isCombinable') final  bool isCombinable;
@override@JsonKey(name: 'status') final  int? status;
@override@JsonKey(name: 'brandId') final  String? brandId;

/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignModelCopyWith<_CampaignModel> get copyWith => __$CampaignModelCopyWithImpl<_CampaignModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampaignModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampaignModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.brandLogo, brandLogo) || other.brandLogo == brandLogo)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCombinable, isCombinable) || other.isCombinable == isCombinable)&&(identical(other.status, status) || other.status == status)&&(identical(other.brandId, brandId) || other.brandId == brandId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,image,brandName,brandLogo,endDate,isCombinable,status,brandId);

@override
String toString() {
  return 'CampaignModel(id: $id, name: $name, description: $description, image: $image, brandName: $brandName, brandLogo: $brandLogo, endDate: $endDate, isCombinable: $isCombinable, status: $status, brandId: $brandId)';
}


}

/// @nodoc
abstract mixin class _$CampaignModelCopyWith<$Res> implements $CampaignModelCopyWith<$Res> {
  factory _$CampaignModelCopyWith(_CampaignModel value, $Res Function(_CampaignModel) _then) = __$CampaignModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String description,@JsonKey(name: 'image') String? image,@JsonKey(name: 'brandName') String brandName,@JsonKey(name: 'brandLogo') String? brandLogo,@JsonKey(name: 'endDate') String endDate,@JsonKey(name: 'isCombinable') bool isCombinable,@JsonKey(name: 'status') int? status,@JsonKey(name: 'brandId') String? brandId
});




}
/// @nodoc
class __$CampaignModelCopyWithImpl<$Res>
    implements _$CampaignModelCopyWith<$Res> {
  __$CampaignModelCopyWithImpl(this._self, this._then);

  final _CampaignModel _self;
  final $Res Function(_CampaignModel) _then;

/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? image = freezed,Object? brandName = null,Object? brandLogo = freezed,Object? endDate = null,Object? isCombinable = null,Object? status = freezed,Object? brandId = freezed,}) {
  return _then(_CampaignModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,brandLogo: freezed == brandLogo ? _self.brandLogo : brandLogo // ignore: cast_nullable_to_non_nullable
as String?,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,isCombinable: null == isCombinable ? _self.isCombinable : isCombinable // ignore: cast_nullable_to_non_nullable
as bool,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
