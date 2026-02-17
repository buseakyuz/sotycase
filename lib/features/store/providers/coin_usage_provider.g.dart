// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_usage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CoinUsage)
final coinUsageProvider = CoinUsageProvider._();

final class CoinUsageProvider extends $NotifierProvider<CoinUsage, double> {
  CoinUsageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coinUsageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coinUsageHash();

  @$internal
  @override
  CoinUsage create() => CoinUsage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$coinUsageHash() => r'56012b5bb6a93eb623a03e7b04c20cda57dd3fe3';

abstract class _$CoinUsage extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
