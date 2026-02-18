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

@JsonKey(name: 'type') int? get type;@JsonKey(name: 'typeName') String? get typeName;@JsonKey(name: 'transactionType') int? get transactionType;@JsonKey(name: 'transactionTypeName') String? get transactionTypeName;@JsonKey(name: 'date') String? get date;@JsonKey(name: 'coin') double? get coin;@JsonKey(name: 'balance') double? get balance;@JsonKey(name: 'detail') TransactionDetail? get detail;
/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletTransactionModelCopyWith<WalletTransactionModel> get copyWith => _$WalletTransactionModelCopyWithImpl<WalletTransactionModel>(this as WalletTransactionModel, _$identity);

  /// Serializes this WalletTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletTransactionModel&&(identical(other.type, type) || other.type == type)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionTypeName, transactionTypeName) || other.transactionTypeName == transactionTypeName)&&(identical(other.date, date) || other.date == date)&&(identical(other.coin, coin) || other.coin == coin)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,typeName,transactionType,transactionTypeName,date,coin,balance,detail);

@override
String toString() {
  return 'WalletTransactionModel(type: $type, typeName: $typeName, transactionType: $transactionType, transactionTypeName: $transactionTypeName, date: $date, coin: $coin, balance: $balance, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $WalletTransactionModelCopyWith<$Res>  {
  factory $WalletTransactionModelCopyWith(WalletTransactionModel value, $Res Function(WalletTransactionModel) _then) = _$WalletTransactionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'type') int? type,@JsonKey(name: 'typeName') String? typeName,@JsonKey(name: 'transactionType') int? transactionType,@JsonKey(name: 'transactionTypeName') String? transactionTypeName,@JsonKey(name: 'date') String? date,@JsonKey(name: 'coin') double? coin,@JsonKey(name: 'balance') double? balance,@JsonKey(name: 'detail') TransactionDetail? detail
});


$TransactionDetailCopyWith<$Res>? get detail;

}
/// @nodoc
class _$WalletTransactionModelCopyWithImpl<$Res>
    implements $WalletTransactionModelCopyWith<$Res> {
  _$WalletTransactionModelCopyWithImpl(this._self, this._then);

  final WalletTransactionModel _self;
  final $Res Function(WalletTransactionModel) _then;

/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? typeName = freezed,Object? transactionType = freezed,Object? transactionTypeName = freezed,Object? date = freezed,Object? coin = freezed,Object? balance = freezed,Object? detail = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,transactionType: freezed == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as int?,transactionTypeName: freezed == transactionTypeName ? _self.transactionTypeName : transactionTypeName // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,coin: freezed == coin ? _self.coin : coin // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as TransactionDetail?,
  ));
}
/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $TransactionDetailCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  int? type, @JsonKey(name: 'typeName')  String? typeName, @JsonKey(name: 'transactionType')  int? transactionType, @JsonKey(name: 'transactionTypeName')  String? transactionTypeName, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'coin')  double? coin, @JsonKey(name: 'balance')  double? balance, @JsonKey(name: 'detail')  TransactionDetail? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletTransactionModel() when $default != null:
return $default(_that.type,_that.typeName,_that.transactionType,_that.transactionTypeName,_that.date,_that.coin,_that.balance,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  int? type, @JsonKey(name: 'typeName')  String? typeName, @JsonKey(name: 'transactionType')  int? transactionType, @JsonKey(name: 'transactionTypeName')  String? transactionTypeName, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'coin')  double? coin, @JsonKey(name: 'balance')  double? balance, @JsonKey(name: 'detail')  TransactionDetail? detail)  $default,) {final _that = this;
switch (_that) {
case _WalletTransactionModel():
return $default(_that.type,_that.typeName,_that.transactionType,_that.transactionTypeName,_that.date,_that.coin,_that.balance,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'type')  int? type, @JsonKey(name: 'typeName')  String? typeName, @JsonKey(name: 'transactionType')  int? transactionType, @JsonKey(name: 'transactionTypeName')  String? transactionTypeName, @JsonKey(name: 'date')  String? date, @JsonKey(name: 'coin')  double? coin, @JsonKey(name: 'balance')  double? balance, @JsonKey(name: 'detail')  TransactionDetail? detail)?  $default,) {final _that = this;
switch (_that) {
case _WalletTransactionModel() when $default != null:
return $default(_that.type,_that.typeName,_that.transactionType,_that.transactionTypeName,_that.date,_that.coin,_that.balance,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletTransactionModel implements WalletTransactionModel {
  const _WalletTransactionModel({@JsonKey(name: 'type') this.type, @JsonKey(name: 'typeName') this.typeName, @JsonKey(name: 'transactionType') this.transactionType, @JsonKey(name: 'transactionTypeName') this.transactionTypeName, @JsonKey(name: 'date') this.date, @JsonKey(name: 'coin') this.coin, @JsonKey(name: 'balance') this.balance, @JsonKey(name: 'detail') this.detail});
  factory _WalletTransactionModel.fromJson(Map<String, dynamic> json) => _$WalletTransactionModelFromJson(json);

@override@JsonKey(name: 'type') final  int? type;
@override@JsonKey(name: 'typeName') final  String? typeName;
@override@JsonKey(name: 'transactionType') final  int? transactionType;
@override@JsonKey(name: 'transactionTypeName') final  String? transactionTypeName;
@override@JsonKey(name: 'date') final  String? date;
@override@JsonKey(name: 'coin') final  double? coin;
@override@JsonKey(name: 'balance') final  double? balance;
@override@JsonKey(name: 'detail') final  TransactionDetail? detail;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletTransactionModel&&(identical(other.type, type) || other.type == type)&&(identical(other.typeName, typeName) || other.typeName == typeName)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.transactionTypeName, transactionTypeName) || other.transactionTypeName == transactionTypeName)&&(identical(other.date, date) || other.date == date)&&(identical(other.coin, coin) || other.coin == coin)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,typeName,transactionType,transactionTypeName,date,coin,balance,detail);

@override
String toString() {
  return 'WalletTransactionModel(type: $type, typeName: $typeName, transactionType: $transactionType, transactionTypeName: $transactionTypeName, date: $date, coin: $coin, balance: $balance, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$WalletTransactionModelCopyWith<$Res> implements $WalletTransactionModelCopyWith<$Res> {
  factory _$WalletTransactionModelCopyWith(_WalletTransactionModel value, $Res Function(_WalletTransactionModel) _then) = __$WalletTransactionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'type') int? type,@JsonKey(name: 'typeName') String? typeName,@JsonKey(name: 'transactionType') int? transactionType,@JsonKey(name: 'transactionTypeName') String? transactionTypeName,@JsonKey(name: 'date') String? date,@JsonKey(name: 'coin') double? coin,@JsonKey(name: 'balance') double? balance,@JsonKey(name: 'detail') TransactionDetail? detail
});


@override $TransactionDetailCopyWith<$Res>? get detail;

}
/// @nodoc
class __$WalletTransactionModelCopyWithImpl<$Res>
    implements _$WalletTransactionModelCopyWith<$Res> {
  __$WalletTransactionModelCopyWithImpl(this._self, this._then);

  final _WalletTransactionModel _self;
  final $Res Function(_WalletTransactionModel) _then;

/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? typeName = freezed,Object? transactionType = freezed,Object? transactionTypeName = freezed,Object? date = freezed,Object? coin = freezed,Object? balance = freezed,Object? detail = freezed,}) {
  return _then(_WalletTransactionModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int?,typeName: freezed == typeName ? _self.typeName : typeName // ignore: cast_nullable_to_non_nullable
as String?,transactionType: freezed == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as int?,transactionTypeName: freezed == transactionTypeName ? _self.transactionTypeName : transactionTypeName // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,coin: freezed == coin ? _self.coin : coin // ignore: cast_nullable_to_non_nullable
as double?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as TransactionDetail?,
  ));
}

/// Create a copy of WalletTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $TransactionDetailCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// @nodoc
mixin _$TransactionDetail {

@JsonKey(name: 'title') String? get title;@JsonKey(name: 'subTitle') String? get subTitle;@JsonKey(name: 'orderNumber') String? get orderNumber;@JsonKey(name: 'transferParty') String? get transferParty;
/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionDetailCopyWith<TransactionDetail> get copyWith => _$TransactionDetailCopyWithImpl<TransactionDetail>(this as TransactionDetail, _$identity);

  /// Serializes this TransactionDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionDetail&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.transferParty, transferParty) || other.transferParty == transferParty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subTitle,orderNumber,transferParty);

@override
String toString() {
  return 'TransactionDetail(title: $title, subTitle: $subTitle, orderNumber: $orderNumber, transferParty: $transferParty)';
}


}

/// @nodoc
abstract mixin class $TransactionDetailCopyWith<$Res>  {
  factory $TransactionDetailCopyWith(TransactionDetail value, $Res Function(TransactionDetail) _then) = _$TransactionDetailCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'title') String? title,@JsonKey(name: 'subTitle') String? subTitle,@JsonKey(name: 'orderNumber') String? orderNumber,@JsonKey(name: 'transferParty') String? transferParty
});




}
/// @nodoc
class _$TransactionDetailCopyWithImpl<$Res>
    implements $TransactionDetailCopyWith<$Res> {
  _$TransactionDetailCopyWithImpl(this._self, this._then);

  final TransactionDetail _self;
  final $Res Function(TransactionDetail) _then;

/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? subTitle = freezed,Object? orderNumber = freezed,Object? transferParty = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subTitle: freezed == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,transferParty: freezed == transferParty ? _self.transferParty : transferParty // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionDetail].
extension TransactionDetailPatterns on TransactionDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionDetail value)  $default,){
final _that = this;
switch (_that) {
case _TransactionDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'title')  String? title, @JsonKey(name: 'subTitle')  String? subTitle, @JsonKey(name: 'orderNumber')  String? orderNumber, @JsonKey(name: 'transferParty')  String? transferParty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
return $default(_that.title,_that.subTitle,_that.orderNumber,_that.transferParty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'title')  String? title, @JsonKey(name: 'subTitle')  String? subTitle, @JsonKey(name: 'orderNumber')  String? orderNumber, @JsonKey(name: 'transferParty')  String? transferParty)  $default,) {final _that = this;
switch (_that) {
case _TransactionDetail():
return $default(_that.title,_that.subTitle,_that.orderNumber,_that.transferParty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'title')  String? title, @JsonKey(name: 'subTitle')  String? subTitle, @JsonKey(name: 'orderNumber')  String? orderNumber, @JsonKey(name: 'transferParty')  String? transferParty)?  $default,) {final _that = this;
switch (_that) {
case _TransactionDetail() when $default != null:
return $default(_that.title,_that.subTitle,_that.orderNumber,_that.transferParty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionDetail implements TransactionDetail {
  const _TransactionDetail({@JsonKey(name: 'title') this.title, @JsonKey(name: 'subTitle') this.subTitle, @JsonKey(name: 'orderNumber') this.orderNumber, @JsonKey(name: 'transferParty') this.transferParty});
  factory _TransactionDetail.fromJson(Map<String, dynamic> json) => _$TransactionDetailFromJson(json);

@override@JsonKey(name: 'title') final  String? title;
@override@JsonKey(name: 'subTitle') final  String? subTitle;
@override@JsonKey(name: 'orderNumber') final  String? orderNumber;
@override@JsonKey(name: 'transferParty') final  String? transferParty;

/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionDetailCopyWith<_TransactionDetail> get copyWith => __$TransactionDetailCopyWithImpl<_TransactionDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionDetail&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.transferParty, transferParty) || other.transferParty == transferParty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subTitle,orderNumber,transferParty);

@override
String toString() {
  return 'TransactionDetail(title: $title, subTitle: $subTitle, orderNumber: $orderNumber, transferParty: $transferParty)';
}


}

/// @nodoc
abstract mixin class _$TransactionDetailCopyWith<$Res> implements $TransactionDetailCopyWith<$Res> {
  factory _$TransactionDetailCopyWith(_TransactionDetail value, $Res Function(_TransactionDetail) _then) = __$TransactionDetailCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'title') String? title,@JsonKey(name: 'subTitle') String? subTitle,@JsonKey(name: 'orderNumber') String? orderNumber,@JsonKey(name: 'transferParty') String? transferParty
});




}
/// @nodoc
class __$TransactionDetailCopyWithImpl<$Res>
    implements _$TransactionDetailCopyWith<$Res> {
  __$TransactionDetailCopyWithImpl(this._self, this._then);

  final _TransactionDetail _self;
  final $Res Function(_TransactionDetail) _then;

/// Create a copy of TransactionDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? subTitle = freezed,Object? orderNumber = freezed,Object? transferParty = freezed,}) {
  return _then(_TransactionDetail(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subTitle: freezed == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,transferParty: freezed == transferParty ? _self.transferParty : transferParty // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
