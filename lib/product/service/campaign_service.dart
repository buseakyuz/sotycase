import 'package:dio/dio.dart';
import '../models/base/base_response.dart';
import '../models/campaign/campaign_model.dart';

class CampaignService {
  final Dio _dio;

  CampaignService(this._dio);

  Future<BaseResponse<List<CampaignModel>>> getActiveCampaign(
    String brandId,
    bool isAllUsers,
    int channelType,
    int pageNumber,
    int pageSize,
    int sortDirection,
  ) async {
    try {
      final response = await _dio.get(
        'Campaign/GetActiveCampaign/$brandId',
        queryParameters: {
          'IsAllUsers': isAllUsers,
          'ChannelType': channelType,
          'PageNumber': pageNumber,
          'PageSize': pageSize,
          'SortDirection': sortDirection,
        },
      );
      return BaseResponse.fromJson(
        response.data,
        (json) {
          if (json is List) {
            return json
                .map((e) => CampaignModel.fromJson(e as Map<String, dynamic>))
                .toList();
          }
          return [];
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<dynamic>> generatePaymentQrCode(
      Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(
        'Campaign/GeneratePaymentQrCodeWithSotyCoinsAndCampaigns',
        data: body,
      );
      return BaseResponse.fromJson(response.data, (json) => json);
    } catch (e) {
      rethrow;
    }
  }
}
