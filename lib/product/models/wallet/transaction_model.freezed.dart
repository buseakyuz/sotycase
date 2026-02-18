// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletTransactionModel {

@JsonKey(name: 'Amount') double? get amount;@JsonKey(name: 'Title') String? get title;@JsonKey(name: 'OrderNo') String? get orderNo;@JsonKey(name: 'TransactionDate') String? get transactionDate;@JsonKey(name: 'TransactionType') String? get transactionType;@JsonKey(name: 'BrandName') String? get brandName;
/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletTransactionModelCopyWith<WalletTransactionModel> get copyWith => _$WalletTransactionModelCopyWithImpl<WalletTransactionModel>(this as WalletTransactionModel, _$identity);

  /// Serializes this WalletTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletTransactionModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.brandName, brandName) || other.brandName == brandName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,title,orderNo,transactionDate,transactionType,brandName);

@override
String toString() {
  return 'WalletTransactionModel(amount: $amount, title: $title, orderNo: $orderNo, transactionDate: $transactionDate, transactionType: $transactionType, brandName: $brandName)';
}


}

/// @nodoc
abstract mixin class $WalletTransactionModelCopyWith<$Res>  {
  factory $WalletTransactionModelCopyWith(WalletTransactionModel value, $Res Function(WalletTransactionModel) _then) = _$WalletTransactionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Amount') double? amount,@JsonKey(name: 'Title') String? title,@JsonKey(name: 'OrderNo') String? orderNo,@JsonKey(name: 'TransactionDate') String? transactionDate,@JsonKey(name: 'TransactionType') String? transactionType,@JsonKey(name: 'BrandName') String? brandName
});




}
/// @nodoc
class _$WalletTransactionModelCopyWithImpl<$Res>
    implements $WalletTransactionModelCopyWith<$Res> {
  _$WalletTransactionModelCopyWithImpl(this._self, this._then);

  final WalletTransactionModel _self;
  final $Res Function(WalletTransactionModel) _then;

/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = freezed,Object? title = freezed,Object? orderNo = freezed,Object? transactionDate = freezed,Object? transactionType = freezed,Object? brandName = freezed,}) {
  return _then(_self.copyWith(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,orderNo: freezed == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String?,transactionDate: freezed == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as String?,transactionType: freezed == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String?,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletTransactionModel].
extension WalletTransactionModelPatterns on WalletTransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletTransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletTransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletTransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletTransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletTransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletTransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Amount')  double? amount, @JsonKey(name: 'Title')  String? title, @JsonKey(name: 'OrderNo')  String? orderNo, @JsonKey(name: 'TransactionDate')  String? transactionDate, @JsonKey(name: 'TransactionType')  String? transactionType, @JsonKey(name: 'BrandName')  String? brandName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletTransactionModel() when $default != null:
return $default(_that.amount,_that.title,_that.orderNo,_that.transactionDate,_that.transactionType,_that.brandName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Amount')  double? amount, @JsonKey(name: 'Title')  String? title, @JsonKey(name: 'OrderNo')  String? orderNo, @JsonKey(name: 'TransactionDate')  String? transactionDate, @JsonKey(name: 'TransactionType')  String? transactionType, @JsonKey(name: 'BrandName')  String? brandName)  $default,) {final _that = this;
switch (_that) {
case _WalletTransactionModel():
return $default(_that.amount,_that.title,_that.orderNo,_that.transactionDate,_that.transactionType,_that.brandName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Amount')  double? amount, @JsonKey(name: 'Title')  String? title, @JsonKey(name: 'OrderNo')  String? orderNo, @JsonKey(name: 'TransactionDate')  String? transactionDate, @JsonKey(name: 'TransactionType')  String? transactionType, @JsonKey(name: 'BrandName')  String? brandName)?  $default,) {final _that = this;
switch (_that) {
case _WalletTransactionModel() when $default != null:
return $default(_that.amount,_that.title,_that.orderNo,_that.transactionDate,_that.transactionType,_that.brandName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletTransactionModel implements WalletTransactionModel {
  const _WalletTransactionModel({@JsonKey(name: 'Amount') this.amount, @JsonKey(name: 'Title') this.title, @JsonKey(name: 'OrderNo') this.orderNo, @JsonKey(name: 'TransactionDate') this.transactionDate, @JsonKey(name: 'TransactionType') this.transactionType, @JsonKey(name: 'BrandName') this.brandName});
  factory _WalletTransactionModel.fromJson(Map<String, dynamic> json) => _$WalletTransactionModelFromJson(json);

@override@JsonKey(name: 'Amount') final  double? amount;
@override@JsonKey(name: 'Title') final  String? title;
@override@JsonKey(name: 'OrderNo') final  String? orderNo;
@override@JsonKey(name: 'TransactionDate') final  String? transactionDate;
@override@JsonKey(name: 'TransactionType') final  String? transactionType;
@override@JsonKey(name: 'BrandName') final  String? brandName;

/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletTransactionModelCopyWith<_WalletTransactionModel> get copyWith => __$WalletTransactionModelCopyWithImpl<_WalletTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletTransactionModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.brandName, brandName) || other.brandName == brandName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,title,orderNo,transactionDate,transactionType,brandName);

@override
String toString() {
  return 'WalletTransactionModel(amount: $amount, title: $title, orderNo: $orderNo, transactionDate: $transactionDate, transactionType: $transactionType, brandName: $brandName)';
}


}

/// @nodoc
abstract mixin class _$WalletTransactionModelCopyWith<$Res> implements $WalletTransactionModelCopyWith<$Res> {
  factory _$WalletTransactionModelCopyWith(_WalletTransactionModel value, $Res Function(_WalletTransactionModel) _then) = __$WalletTransactionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Amount') double? amount,@JsonKey(name: 'Title') String? title,@JsonKey(name: 'OrderNo') String? orderNo,@JsonKey(name: 'TransactionDate') String? transactionDate,@JsonKey(name: 'TransactionType') String? transactionType,@JsonKey(name: 'BrandName') String? brandName
});




}
/// @nodoc
class __$WalletTransactionModelCopyWithImpl<$Res>
    implements _$WalletTransactionModelCopyWith<$Res> {
  __$WalletTransactionModelCopyWithImpl(this._self, this._then);

  final _WalletTransactionModel _self;
  final $Res Function(_WalletTransactionModel) _then;

/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = freezed,Object? title = freezed,Object? orderNo = freezed,Object? transactionDate = freezed,Object? transactionType = freezed,Object? brandName = freezed,}) {
  return _then(_WalletTransactionModel(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,orderNo: freezed == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String?,transactionDate: freezed == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as String?,transactionType: freezed == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String?,brandName: freezed == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
