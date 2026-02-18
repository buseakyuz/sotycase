import 'package:dio/dio.dart';
import '../models/base/base_response.dart';
import '../models/wallet/wallet_summary_model.dart';

class WalletService {
  final Dio _dio;

  WalletService(this._dio);

  Future<BaseResponse<WalletSummaryModel>> getWalletSummary(
    String brandId,
  ) async {
    try {
      final response = await _dio.get('Wallet/Brands/$brandId/Summary');
      return BaseResponse.fromJson(
        response.data,
        (json) => WalletSummaryModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<dynamic>> getTransactions(
    String brandId,
    int filterType,
  ) async {
    try {
      final response = await _dio.get(
        'Wallet/Brands/$brandId/Transactions',
        queryParameters: {'FilterType': filterType},
      );

      return BaseResponse.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<dynamic>> getWaitingRewardCoin(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _dio.post(
        'Sotier/GetWaitingRewardCoin',
        data: body,
      );
      return BaseResponse.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }
}
