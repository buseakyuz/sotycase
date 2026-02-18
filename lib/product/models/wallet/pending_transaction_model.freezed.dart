// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PendingTransactionModel {

 String get id; String get title; double get amount; DateTime get expiryDate; String get orderNo;
/// Create a copy of PendingTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingTransactionModelCopyWith<PendingTransactionModel> get copyWith => _$PendingTransactionModelCopyWithImpl<PendingTransactionModel>(this as PendingTransactionModel, _$identity);

  /// Serializes this PendingTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,expiryDate,orderNo);

@override
String toString() {
  return 'PendingTransactionModel(id: $id, title: $title, amount: $amount, expiryDate: $expiryDate, orderNo: $orderNo)';
}


}

/// @nodoc
abstract mixin class $PendingTransactionModelCopyWith<$Res>  {
  factory $PendingTransactionModelCopyWith(PendingTransactionModel value, $Res Function(PendingTransactionModel) _then) = _$PendingTransactionModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, double amount, DateTime expiryDate, String orderNo
});




}
/// @nodoc
class _$PendingTransactionModelCopyWithImpl<$Res>
    implements $PendingTransactionModelCopyWith<$Res> {
  _$PendingTransactionModelCopyWithImpl(this._self, this._then);

  final PendingTransactionModel _self;
  final $Res Function(PendingTransactionModel) _then;

/// Create a copy of PendingTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? expiryDate = null,Object? orderNo = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingTransactionModel].
extension PendingTransactionModelPatterns on PendingTransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingTransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingTransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingTransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _PendingTransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingTransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PendingTransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  double amount,  DateTime expiryDate,  String orderNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingTransactionModel() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.expiryDate,_that.orderNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  double amount,  DateTime expiryDate,  String orderNo)  $default,) {final _that = this;
switch (_that) {
case _PendingTransactionModel():
return $default(_that.id,_that.title,_that.amount,_that.expiryDate,_that.orderNo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  double amount,  DateTime expiryDate,  String orderNo)?  $default,) {final _that = this;
switch (_that) {
case _PendingTransactionModel() when $default != null:
return $default(_that.id,_that.title,_that.amount,_that.expiryDate,_that.orderNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingTransactionModel implements PendingTransactionModel {
  const _PendingTransactionModel({required this.id, required this.title, required this.amount, required this.expiryDate, required this.orderNo});
  factory _PendingTransactionModel.fromJson(Map<String, dynamic> json) => _$PendingTransactionModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  double amount;
@override final  DateTime expiryDate;
@override final  String orderNo;

/// Create a copy of PendingTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingTransactionModelCopyWith<_PendingTransactionModel> get copyWith => __$PendingTransactionModelCopyWithImpl<_PendingTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount,expiryDate,orderNo);

@override
String toString() {
  return 'PendingTransactionModel(id: $id, title: $title, amount: $amount, expiryDate: $expiryDate, orderNo: $orderNo)';
}


}

/// @nodoc
abstract mixin class _$PendingTransactionModelCopyWith<$Res> implements $PendingTransactionModelCopyWith<$Res> {
  factory _$PendingTransactionModelCopyWith(_PendingTransactionModel value, $Res Function(_PendingTransactionModel) _then) = __$PendingTransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, double amount, DateTime expiryDate, String orderNo
});




}
/// @nodoc
class __$PendingTransactionModelCopyWithImpl<$Res>
    implements _$PendingTransactionModelCopyWith<$Res> {
  __$PendingTransactionModelCopyWithImpl(this._self, this._then);

  final _PendingTransactionModel _self;
  final $Res Function(_PendingTransactionModel) _then;

/// Create a copy of PendingTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? amount = null,Object? expiryDate = null,Object? orderNo = null,}) {
  return _then(_PendingTransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
