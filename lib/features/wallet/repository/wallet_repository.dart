import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../product/models/wallet/wallet_summary_model.dart';
import '../../../../product/models/wallet/transaction_model.dart';
import '../../../../product/network/network_provider.dart';
import '../../../../product/service/wallet_service.dart';

part 'wallet_repository.g.dart';

class WalletRepository {
  final WalletService _walletService;

  WalletRepository(this._walletService);

  Future<WalletSummaryModel?> getWalletSummary() async {
    try {
      final response = await _walletService.getWalletSummary();
      return response.responseData;
    } catch (e) {
      return null;
    }
  }

  Future<List<WalletTransactionModel>?> getTransactions() async {
    try {
      final response = await _walletService.getTransactions();
      return response.responseData;
    } catch (e) {
      return null;
    }
  }

  Future<bool> getWaitingRewardCoin(String orderId) async {
    try {
      final response = await _walletService.getWaitingRewardCoin({'orderId': orderId});
      return response.metaData?.isSuccess ?? false;
    } catch (e) {
      return false;
    }
  }
}

@riverpod
WalletRepository walletRepository(Ref ref) {
  final dio = ref.watch(networkServiceProvider);
  return WalletRepository(WalletService(dio));
}

@riverpod
Future<WalletSummaryModel?> walletSummary(Ref ref) async {
  return ref.watch(walletRepositoryProvider).getWalletSummary();
}

@riverpod
Future<List<WalletTransactionModel>?> transactions(Ref ref) async {
  return ref.watch(walletRepositoryProvider).getTransactions();
}
