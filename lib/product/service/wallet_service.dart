import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/base/base_response.dart';
import '../models/wallet/wallet_summary_model.dart';
import '../models/wallet/transaction_model.dart';

part 'wallet_service.g.dart';

@RestApi()
abstract class WalletService {
  factory WalletService(Dio dio, {String baseUrl}) = _WalletService;

  @GET("Wallet/Brands/{brandId}/Summary")
  Future<BaseResponse<WalletSummaryModel>> getWalletSummary(@Path("brandId") String brandId);

  @GET("Wallet/Brands/{brandId}/Transactions")
  Future<BaseResponse<List<WalletTransactionModel>>> getTransactions(
    @Path("brandId") String brandId,
    @Query("FilterType") int filterType,
  );

  @POST("Sotier/GetWaitingRewardCoin")
  Future<BaseResponse<dynamic>> getWaitingRewardCoin(@Body() Map<String, dynamic> body);
}
