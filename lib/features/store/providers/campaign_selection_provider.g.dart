// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_selection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CampaignSelection)
final campaignSelectionProvider = CampaignSelectionProvider._();

final class CampaignSelectionProvider
    extends $NotifierProvider<CampaignSelection, Set<CampaignModel>> {
  CampaignSelectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'campaignSelectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$campaignSelectionHash();

  @$internal
  @override
  CampaignSelection create() => CampaignSelection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<CampaignModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<CampaignModel>>(value),
    );
  }
}

String _$campaignSelectionHash() => r'af8d73434b015fec496b42b8512be0ad5f2373dc';

abstract class _$CampaignSelection extends $Notifier<Set<CampaignModel>> {
  Set<CampaignModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<CampaignModel>, Set<CampaignModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<CampaignModel>, Set<CampaignModel>>,
              Set<CampaignModel>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
