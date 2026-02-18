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

String _$walletRepositoryHash() => r'8c125179e3c6a4cb6db6aa0c6fbd2271e388fa82';

@ProviderFor(walletSummary)
final walletSummaryProvider = WalletSummaryFamily._();

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
  WalletSummaryProvider._({
    required WalletSummaryFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'walletSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$walletSummaryHash();

  @override
  String toString() {
    return r'walletSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WalletSummaryModel?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WalletSummaryModel?> create(Ref ref) {
    final argument = this.argument as String?;
    return walletSummary(ref, brandId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$walletSummaryHash() => r'b1a2e6f69120b71a1e7f3f899fd0d124cb4cb958';

final class WalletSummaryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WalletSummaryModel?>, String?> {
  WalletSummaryFamily._()
    : super(
        retry: null,
        name: r'walletSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WalletSummaryProvider call({String? brandId}) =>
      WalletSummaryProvider._(argument: brandId, from: this);

  @override
  String toString() => r'walletSummaryProvider';
}

@ProviderFor(transactions)
final transactionsProvider = TransactionsFamily._();

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
  TransactionsProvider._({
    required TransactionsFamily super.from,
    required ({String? brandId, int filterType}) super.argument,
  }) : super(
         retry: null,
         name: r'transactionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionsHash();

  @override
  String toString() {
    return r'transactionsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<WalletTransactionModel>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WalletTransactionModel>?> create(Ref ref) {
    final argument = this.argument as ({String? brandId, int filterType});
    return transactions(
      ref,
      brandId: argument.brandId,
      filterType: argument.filterType,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionsHash() => r'ff33212c15c06583b69bb5f738a1b5f020f0c536';

final class TransactionsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<WalletTransactionModel>?>,
          ({String? brandId, int filterType})
        > {
  TransactionsFamily._()
    : super(
        retry: null,
        name: r'transactionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionsProvider call({String? brandId, int filterType = 1}) =>
      TransactionsProvider._(
        argument: (brandId: brandId, filterType: filterType),
        from: this,
      );

  @override
  String toString() => r'transactionsProvider';
}
