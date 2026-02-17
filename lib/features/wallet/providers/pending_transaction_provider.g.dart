// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PendingTransaction)
final pendingTransactionProvider = PendingTransactionProvider._();

final class PendingTransactionProvider
    extends
        $NotifierProvider<PendingTransaction, List<PendingTransactionModel>> {
  PendingTransactionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingTransactionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingTransactionHash();

  @$internal
  @override
  PendingTransaction create() => PendingTransaction();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PendingTransactionModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PendingTransactionModel>>(
        value,
      ),
    );
  }
}

String _$pendingTransactionHash() =>
    r'1cae86efa25f576d09f01405e0ce098831e75f3a';

abstract class _$PendingTransaction
    extends $Notifier<List<PendingTransactionModel>> {
  List<PendingTransactionModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              List<PendingTransactionModel>,
              List<PendingTransactionModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                List<PendingTransactionModel>,
                List<PendingTransactionModel>
              >,
              List<PendingTransactionModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
