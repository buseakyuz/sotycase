import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotycase/product/network/interceptor/auth_interceptor.dart';
import 'package:sotycase/product/providers/auth/auth_provider.dart'; // Add this import back
import '../../../../product/models/wallet/wallet_summary_model.dart';
import '../../../../product/models/wallet/transaction_model.dart';
import '../../../../product/network/network_provider.dart';
import '../../../../product/service/wallet_service.dart';

part 'wallet_repository.g.dart';

class WalletRepository {
  final WalletService _walletService;
  final Ref _ref;

  WalletRepository(this._walletService, this._ref);

  static const String _defaultBrandId = '550e8400-e29b-41d4-a716-446655440000';

  Future<T?> _handleRequest<T>(Future<T?> Function() request) async { // Changed signature
    try {
      return await request();
    } on TokenRefreshException {
      await _ref.read(authenticationProvider.notifier).logout();
      return null;
    } catch (e) {
      // Log other errors if needed
      return null;
    }
  }

  Future<WalletSummaryModel?> getWalletSummary({String? brandId}) async {
    return _handleRequest(() async {
      final response = await _walletService.getWalletSummary(
        brandId ?? _defaultBrandId,
      );
      return response.responseData;
    });
  }

  Future<List<WalletTransactionModel>?> getTransactions({
    String? brandId,
    int filterType = 1,
  }) async {
    return _handleRequest(() async {
      final response = await _walletService.getTransactions(
        brandId ?? _defaultBrandId,
        filterType,
      );
      return response.responseData;
    });
  }

  Future<bool> getWaitingRewardCoin(String brandId) async {
    final result = await _handleRequest(() async {
      final response = await _walletService.getWaitingRewardCoin({
        'brandId': brandId,
      });
      return response.metaData?.isSuccess ?? false;
    });
    return result ?? false;
  }
}

@riverpod
WalletRepository walletRepository(Ref ref) {
  final dio = ref.watch(networkServiceProvider);
  return WalletRepository(WalletService(dio), ref);
}

@riverpod
Future<WalletSummaryModel?> walletSummary(Ref ref, {String? brandId}) async {
  return ref.watch(walletRepositoryProvider).getWalletSummary(brandId: brandId);
}

@riverpod
Future<List<WalletTransactionModel>?> transactions(
  Ref ref, {
  String? brandId,
  int filterType = 1,
}) async {
  return ref
      .watch(walletRepositoryProvider)
      .getTransactions(brandId: brandId, filterType: filterType);
}
