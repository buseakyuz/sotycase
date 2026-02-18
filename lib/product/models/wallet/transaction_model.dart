// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class WalletTransactionModel with _$WalletTransactionModel {
  const factory WalletTransactionModel({
    @JsonKey(name: 'Amount') double? amount,
    @JsonKey(name: 'Title') String? title,
    @JsonKey(name: 'OrderNo') String? orderNo,
    @JsonKey(name: 'TransactionDate') String? transactionDate,
    @JsonKey(name: 'TransactionType') String? transactionType,
    @JsonKey(name: 'BrandName') String? brandName,
  }) = _WalletTransactionModel;

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionModelFromJson(json);
}
