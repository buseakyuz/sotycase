import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../product/network/interceptor/auth_interceptor.dart';
import '../../../product/network/network_provider.dart';
import '../../../product/providers/auth/auth_provider.dart';
import '../../../product/service/campaign_service.dart';

part 'campaign_repository.g.dart';


class CampaignRepository {
  final CampaignService _campaignService;
  final Ref _ref;

  CampaignRepository(this._campaignService, this._ref);

  static const String _defaultBrandId = '550e8400-e29b-41d4-a716-446655440000';

  Future<T?> _handleRequest<T>(Future<T?> Function() request) async { // Changed signature
    try {
      return await request();
    } on TokenRefreshException {
      await _ref.read(authenticationProvider.notifier).logout();
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> getActiveCampaign({String? brandId}) async {
    return _handleRequest(() async {
      final response = await _campaignService.getActiveCampaign(
        brandId ?? _defaultBrandId,
        true, // isAllUsers
        2,    // channelType
        1,    // pageNumber
        10,   // pageSize
        0,    // sortDirection
      );
      return response.responseData;
    });
  }

  Future<bool> generatePaymentQrCode({
    required String brandId,
    required List<String> campaignIds,
    double? coinAmount,
  }) async {
    final result = await _handleRequest(() async {
      final response = await _campaignService.generatePaymentQrCode({
        'brandId': brandId,
        'campaignIds': campaignIds,
        'coinAmount': coinAmount,
      });
      return response.metaData?.isSuccess ?? false;
    });
    return result ?? false;
  }
}

@riverpod
CampaignRepository campaignRepository(Ref ref) {
  final dio = ref.watch(networkServiceProvider);
  return CampaignRepository(CampaignService(dio), ref);
}

@riverpod
Future<dynamic> activeCampaigns(Ref ref, {String? brandId}) async {
  return ref.watch(campaignRepositoryProvider).getActiveCampaign(brandId: brandId);
}
