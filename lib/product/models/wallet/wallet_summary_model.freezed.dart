// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletSummaryModel {

@JsonKey(name: 'brandId') String? get brandId;@JsonKey(name: 'brandName') String? get brandName;@JsonKey(name: 'brandLogo') String? get brandLogo;@JsonKey(name: 'walletLogo') String? get walletLogo;@JsonKey(name: 'walletCover') String? get walletCover;@JsonKey(name: 'totalAvailableCoin') double? get totalAvailableCoin;@JsonKey(name: 'totalAvailableTransferCoin') double? get totalAvailableTransferCoin;@JsonKey(name: 'onlineCampaignCount') int? get onlineCampaignCount;@JsonKey(name: 'storeCampaignCount') int? get storeCampaignCount;@JsonKey(name: 'totalCampaignCount') int? get totalCampaignCount;
/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletSummaryModelCopyWith<WalletSummaryModel> get copyWith => _$WalletSummaryModelCopyWithImpl<WalletSummaryModel>(this as WalletSummaryModel, _$identity);

  /// Serializes this WalletSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletSummaryModel&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.brandLogo, brandLogo) || other.brandLogo == brandLogo)&&(identical(other.walletLogo, walletLogo) || other.walletLogo == walletLogo)&&(identical(other.walletCover, walletCover) || other.walletCover == walletCover)&&(identical(other.totalAvailableCoin, totalAvailableCoin) || other.totalAvailableCoin == totalAvailableCoin)&&(identical(other.totalAvailableTransferCoin, totalAvailableTransferCoin) || other.totalAvailableTransferCoin == totalAvailableTransferCoin)&&(identical(other.onlineCampaignCount, onlineCampaignCount) || other.onlineCampaignCount == onlineCampaignCount)&&(identical(other.storeCampaignCount, storeCampaignCount) || other.storeCampaignCount == storeCampaignCount)&&(identical(other.totalCampaignCount, totalCampaignCount) || other.totalCampaignCount == totalCampaignCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brandId,brandName,brandLogo,walletLogo,walletCover,totalAvailableCoin,totalAvailableTransferCoin,onlineCampaignCount,storeCampaignCount,totalCampaignCount);

@override
String toString() {
  return 'WalletSummaryModel(brandId: $brandId, brandName: $brandName, brandLogo: $brandLogo, walletLogo: $walletLogo, walletCover: $walletCover, totalAvailableCoin: $totalAvailableCoin, totalAvailableTransferCoin: $totalAvailableTransferCoin, onlineCampaignCount: $onlineCampaignCount, storeCampaignCount: $storeCampaignCount, totalCampaignCount: $totalCampaignCount)';
}


}

/// @nodoc
abstract mixin class $WalletSummaryModelCopyWith<$Res>  {
  factory $WalletSummaryModelCopyWith(WalletSummaryModel value, $Res Function(WalletSummaryModel) _then) = _$WalletSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'brandId') String? brandId,@JsonKey(name: 'brandName') String? brandName,@JsonKey(name: 'brandLogo') String? brandLogo,@JsonKey(name: 'walletLogo') String? walletLogo,@JsonKey(name: 'walletCover') String? walletCover,@JsonKey(name: 'totalAvailableCoin') double? totalAvailableCoin,@JsonKey(name: 'totalAvailableTransferCoin') double? totalAvailableTransferCoin,@JsonKey(name: 'onlineCampaignCount') int? onlineCampaignCount,@JsonKey(name: 'storeCampaignCount') int? storeCampaignCount,@JsonKey(name: 'totalCampaignCount') int? totalCampaignCount
});




}
/// @nodoc
class _$WalletSummaryModelCopyWithImpl<$Res>
    implements $WalletSummaryModelCopyWith<$Res> {
  _$WalletSummaryModelCopyWithImpl(this._self, this._then);

  final WalletSummaryModel _self;
  final $Res Function(WalletSummaryModel) _then;

/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brandId = freezed,Object? brandName = freezed,Object? brandLogo = freezed,Object? walletLogo = freezed,Object? walletCover = freezed,Object? totalAvailableCoin = freezed,Object? totalAvailableTransferCoin = freezed,Object? onlineCampaignCount = freezed,Object? storeCampaignCount = freezed,Object? totalCampaignCount = freezed,}) {
  return _then(_self.copyWith(
brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,brandLogo: freezed == brandLogo ? _self.brandLogo : brandLogo // ignore: cast_nullable_to_non_nullable
as String?,walletLogo: freezed == walletLogo ? _self.walletLogo : walletLogo // ignore: cast_nullable_to_non_nullable
as String?,walletCover: freezed == walletCover ? _self.walletCover : walletCover // ignore: cast_nullable_to_non_nullable
as String?,totalAvailableCoin: freezed == totalAvailableCoin ? _self.totalAvailableCoin : totalAvailableCoin // ignore: cast_nullable_to_non_nullable
as double?,totalAvailableTransferCoin: freezed == totalAvailableTransferCoin ? _self.totalAvailableTransferCoin : totalAvailableTransferCoin // ignore: cast_nullable_to_non_nullable
as double?,onlineCampaignCount: freezed == onlineCampaignCount ? _self.onlineCampaignCount : onlineCampaignCount // ignore: cast_nullable_to_non_nullable
as int?,storeCampaignCount: freezed == storeCampaignCount ? _self.storeCampaignCount : storeCampaignCount // ignore: cast_nullable_to_non_nullable
as int?,totalCampaignCount: freezed == totalCampaignCount ? _self.totalCampaignCount : totalCampaignCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletSummaryModel].
extension WalletSummaryModelPatterns on WalletSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'brandId')  String? brandId, @JsonKey(name: 'brandName')  String? brandName, @JsonKey(name: 'brandLogo')  String? brandLogo, @JsonKey(name: 'walletLogo')  String? walletLogo, @JsonKey(name: 'walletCover')  String? walletCover, @JsonKey(name: 'totalAvailableCoin')  double? totalAvailableCoin, @JsonKey(name: 'totalAvailableTransferCoin')  double? totalAvailableTransferCoin, @JsonKey(name: 'onlineCampaignCount')  int? onlineCampaignCount, @JsonKey(name: 'storeCampaignCount')  int? storeCampaignCount, @JsonKey(name: 'totalCampaignCount')  int? totalCampaignCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
return $default(_that.brandId,_that.brandName,_that.brandLogo,_that.walletLogo,_that.walletCover,_that.totalAvailableCoin,_that.totalAvailableTransferCoin,_that.onlineCampaignCount,_that.storeCampaignCount,_that.totalCampaignCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'brandId')  String? brandId, @JsonKey(name: 'brandName')  String? brandName, @JsonKey(name: 'brandLogo')  String? brandLogo, @JsonKey(name: 'walletLogo')  String? walletLogo, @JsonKey(name: 'walletCover')  String? walletCover, @JsonKey(name: 'totalAvailableCoin')  double? totalAvailableCoin, @JsonKey(name: 'totalAvailableTransferCoin')  double? totalAvailableTransferCoin, @JsonKey(name: 'onlineCampaignCount')  int? onlineCampaignCount, @JsonKey(name: 'storeCampaignCount')  int? storeCampaignCount, @JsonKey(name: 'totalCampaignCount')  int? totalCampaignCount)  $default,) {final _that = this;
switch (_that) {
case _WalletSummaryModel():
return $default(_that.brandId,_that.brandName,_that.brandLogo,_that.walletLogo,_that.walletCover,_that.totalAvailableCoin,_that.totalAvailableTransferCoin,_that.onlineCampaignCount,_that.storeCampaignCount,_that.totalCampaignCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'brandId')  String? brandId, @JsonKey(name: 'brandName')  String? brandName, @JsonKey(name: 'brandLogo')  String? brandLogo, @JsonKey(name: 'walletLogo')  String? walletLogo, @JsonKey(name: 'walletCover')  String? walletCover, @JsonKey(name: 'totalAvailableCoin')  double? totalAvailableCoin, @JsonKey(name: 'totalAvailableTransferCoin')  double? totalAvailableTransferCoin, @JsonKey(name: 'onlineCampaignCount')  int? onlineCampaignCount, @JsonKey(name: 'storeCampaignCount')  int? storeCampaignCount, @JsonKey(name: 'totalCampaignCount')  int? totalCampaignCount)?  $default,) {final _that = this;
switch (_that) {
case _WalletSummaryModel() when $default != null:
return $default(_that.brandId,_that.brandName,_that.brandLogo,_that.walletLogo,_that.walletCover,_that.totalAvailableCoin,_that.totalAvailableTransferCoin,_that.onlineCampaignCount,_that.storeCampaignCount,_that.totalCampaignCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletSummaryModel extends WalletSummaryModel {
  const _WalletSummaryModel({@JsonKey(name: 'brandId') this.brandId, @JsonKey(name: 'brandName') this.brandName, @JsonKey(name: 'brandLogo') this.brandLogo, @JsonKey(name: 'walletLogo') this.walletLogo, @JsonKey(name: 'walletCover') this.walletCover, @JsonKey(name: 'totalAvailableCoin') this.totalAvailableCoin, @JsonKey(name: 'totalAvailableTransferCoin') this.totalAvailableTransferCoin, @JsonKey(name: 'onlineCampaignCount') this.onlineCampaignCount, @JsonKey(name: 'storeCampaignCount') this.storeCampaignCount, @JsonKey(name: 'totalCampaignCount') this.totalCampaignCount}): super._();
  factory _WalletSummaryModel.fromJson(Map<String, dynamic> json) => _$WalletSummaryModelFromJson(json);

@override@JsonKey(name: 'brandId') final  String? brandId;
@override@JsonKey(name: 'brandName') final  String? brandName;
@override@JsonKey(name: 'brandLogo') final  String? brandLogo;
@override@JsonKey(name: 'walletLogo') final  String? walletLogo;
@override@JsonKey(name: 'walletCover') final  String? walletCover;
@override@JsonKey(name: 'totalAvailableCoin') final  double? totalAvailableCoin;
@override@JsonKey(name: 'totalAvailableTransferCoin') final  double? totalAvailableTransferCoin;
@override@JsonKey(name: 'onlineCampaignCount') final  int? onlineCampaignCount;
@override@JsonKey(name: 'storeCampaignCount') final  int? storeCampaignCount;
@override@JsonKey(name: 'totalCampaignCount') final  int? totalCampaignCount;

/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletSummaryModelCopyWith<_WalletSummaryModel> get copyWith => __$WalletSummaryModelCopyWithImpl<_WalletSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletSummaryModel&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.brandLogo, brandLogo) || other.brandLogo == brandLogo)&&(identical(other.walletLogo, walletLogo) || other.walletLogo == walletLogo)&&(identical(other.walletCover, walletCover) || other.walletCover == walletCover)&&(identical(other.totalAvailableCoin, totalAvailableCoin) || other.totalAvailableCoin == totalAvailableCoin)&&(identical(other.totalAvailableTransferCoin, totalAvailableTransferCoin) || other.totalAvailableTransferCoin == totalAvailableTransferCoin)&&(identical(other.onlineCampaignCount, onlineCampaignCount) || other.onlineCampaignCount == onlineCampaignCount)&&(identical(other.storeCampaignCount, storeCampaignCount) || other.storeCampaignCount == storeCampaignCount)&&(identical(other.totalCampaignCount, totalCampaignCount) || other.totalCampaignCount == totalCampaignCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brandId,brandName,brandLogo,walletLogo,walletCover,totalAvailableCoin,totalAvailableTransferCoin,onlineCampaignCount,storeCampaignCount,totalCampaignCount);

@override
String toString() {
  return 'WalletSummaryModel(brandId: $brandId, brandName: $brandName, brandLogo: $brandLogo, walletLogo: $walletLogo, walletCover: $walletCover, totalAvailableCoin: $totalAvailableCoin, totalAvailableTransferCoin: $totalAvailableTransferCoin, onlineCampaignCount: $onlineCampaignCount, storeCampaignCount: $storeCampaignCount, totalCampaignCount: $totalCampaignCount)';
}


}

/// @nodoc
abstract mixin class _$WalletSummaryModelCopyWith<$Res> implements $WalletSummaryModelCopyWith<$Res> {
  factory _$WalletSummaryModelCopyWith(_WalletSummaryModel value, $Res Function(_WalletSummaryModel) _then) = __$WalletSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'brandId') String? brandId,@JsonKey(name: 'brandName') String? brandName,@JsonKey(name: 'brandLogo') String? brandLogo,@JsonKey(name: 'walletLogo') String? walletLogo,@JsonKey(name: 'walletCover') String? walletCover,@JsonKey(name: 'totalAvailableCoin') double? totalAvailableCoin,@JsonKey(name: 'totalAvailableTransferCoin') double? totalAvailableTransferCoin,@JsonKey(name: 'onlineCampaignCount') int? onlineCampaignCount,@JsonKey(name: 'storeCampaignCount') int? storeCampaignCount,@JsonKey(name: 'totalCampaignCount') int? totalCampaignCount
});




}
/// @nodoc
class __$WalletSummaryModelCopyWithImpl<$Res>
    implements _$WalletSummaryModelCopyWith<$Res> {
  __$WalletSummaryModelCopyWithImpl(this._self, this._then);

  final _WalletSummaryModel _self;
  final $Res Function(_WalletSummaryModel) _then;

/// Create a copy of WalletSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brandId = freezed,Object? brandName = freezed,Object? brandLogo = freezed,Object? walletLogo = freezed,Object? walletCover = freezed,Object? totalAvailableCoin = freezed,Object? totalAvailableTransferCoin = freezed,Object? onlineCampaignCount = freezed,Object? storeCampaignCount = freezed,Object? totalCampaignCount = freezed,}) {
  return _then(_WalletSummaryModel(
brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as String?,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,brandLogo: freezed == brandLogo ? _self.brandLogo : brandLogo // ignore: cast_nullable_to_non_nullable
as String?,walletLogo: freezed == walletLogo ? _self.walletLogo : walletLogo // ignore: cast_nullable_to_non_nullable
as String?,walletCover: freezed == walletCover ? _self.walletCover : walletCover // ignore: cast_nullable_to_non_nullable
as String?,totalAvailableCoin: freezed == totalAvailableCoin ? _self.totalAvailableCoin : totalAvailableCoin // ignore: cast_nullable_to_non_nullable
as double?,totalAvailableTransferCoin: freezed == totalAvailableTransferCoin ? _self.totalAvailableTransferCoin : totalAvailableTransferCoin // ignore: cast_nullable_to_non_nullable
as double?,onlineCampaignCount: freezed == onlineCampaignCount ? _self.onlineCampaignCount : onlineCampaignCount // ignore: cast_nullable_to_non_nullable
as int?,storeCampaignCount: freezed == storeCampaignCount ? _self.storeCampaignCount : storeCampaignCount // ignore: cast_nullable_to_non_nullable
as int?,totalCampaignCount: freezed == totalCampaignCount ? _self.totalCampaignCount : totalCampaignCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
