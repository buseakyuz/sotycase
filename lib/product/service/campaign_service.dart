import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/base/base_response.dart';

part 'campaign_service.g.dart';

@RestApi()
abstract class CampaignService {
  factory CampaignService(Dio dio, {String baseUrl}) = _CampaignService;

  @GET("Campaign/GetActiveCampaign/{brandId}")
  Future<BaseResponse<dynamic>> getActiveCampaign(
    @Path("brandId") String brandId,
    @Query("IsAllUsers") bool isAllUsers,
    @Query("ChannelType") int channelType,
    @Query("PageNumber") int pageNumber,
    @Query("PageSize") int pageSize,
    @Query("SortDirection") int sortDirection,
  );

  @POST("Campaign/GeneratePaymentQrCodeWithSotyCoinsAndCampaigns")
  Future<BaseResponse<dynamic>> generatePaymentQrCode(@Body() Map<String, dynamic> body);
}
