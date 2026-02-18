// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(walletRepository)
final walletRepositoryProvider = WalletRepositoryProvider._();

final class WalletRepositoryProvider
    extends
        $FunctionalProvider<
          WalletRepository,
          WalletRepository,
          WalletRepository
        >
    with $Provider<WalletRepository> {
  WalletRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletRepositoryHash();

  @$internal
  @override
  $ProviderElement<WalletRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WalletRepository create(Ref ref) {
    return walletRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WalletRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WalletRepository>(value),
    );
  }
}

String _$walletRepositoryHash() => r'c4812cb48e486dcfb8de74077d01b607f590422d';

@ProviderFor(walletSummary)
final walletSummaryProvider = WalletSummaryProvider._();

final class WalletSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<WalletSummaryModel?>,
          WalletSummaryModel?,
          FutureOr<WalletSummaryModel?>
        >
    with
        $FutureModifier<WalletSummaryModel?>,
        $FutureProvider<WalletSummaryModel?> {
  WalletSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletSummaryHash();

  @$internal
  @override
  $FutureProviderElement<WalletSummaryModel?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WalletSummaryModel?> create(Ref ref) {
    return walletSummary(ref);
  }
}

String _$walletSummaryHash() => r'a3f769f350b17216b47c59aef0a3068b6550fdd7';

@ProviderFor(transactions)
final transactionsProvider = TransactionsProvider._();

final class TransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WalletTransactionModel>?>,
          List<WalletTransactionModel>?,
          FutureOr<List<WalletTransactionModel>?>
        >
    with
        $FutureModifier<List<WalletTransactionModel>?>,
        $FutureProvider<List<WalletTransactionModel>?> {
  TransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsHash();

  @$internal
  @override
  $FutureProviderElement<List<WalletTransactionModel>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WalletTransactionModel>?> create(Ref ref) {
    return transactions(ref);
  }
}

String _$transactionsHash() => r'838abbc687dad608a0c0c181c928a322e2a95695';
