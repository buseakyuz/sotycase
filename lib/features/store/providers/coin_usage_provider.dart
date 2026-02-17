import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coin_usage_provider.g.dart';

@riverpod
class CoinUsage extends _$CoinUsage {
  @override
  double build() {
    return 0.0;
  }

  void setAmount(double amount) {
    state = amount;
  }

  void clear() {
    state = 0.0;
  }
}
