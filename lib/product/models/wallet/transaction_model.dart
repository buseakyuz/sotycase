// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class WalletTransactionModel with _$WalletTransactionModel {
  const factory WalletTransactionModel({
    @JsonKey(name: 'type') int? type,
    @JsonKey(name: 'typeName') String? typeName,
    @JsonKey(name: 'transactionType') int? transactionType,
    @JsonKey(name: 'transactionTypeName') String? transactionTypeName,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'coin') double? coin,
    @JsonKey(name: 'balance') double? balance,
    @JsonKey(name: 'detail') TransactionDetail? detail,
  }) = _WalletTransactionModel;

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionModelFromJson(json);
}

@freezed
abstract class TransactionDetail with _$TransactionDetail {
  const factory TransactionDetail({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'subTitle') String? subTitle,
    @JsonKey(name: 'orderNumber') String? orderNumber,
    @JsonKey(name: 'transferParty') String? transferParty,
  }) = _TransactionDetail;

  factory TransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailFromJson(json);
}
