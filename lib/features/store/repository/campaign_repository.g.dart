// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(campaignRepository)
final campaignRepositoryProvider = CampaignRepositoryProvider._();

final class CampaignRepositoryProvider
    extends
        $FunctionalProvider<
          CampaignRepository,
          CampaignRepository,
          CampaignRepository
        >
    with $Provider<CampaignRepository> {
  CampaignRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'campaignRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$campaignRepositoryHash();

  @$internal
  @override
  $ProviderElement<CampaignRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CampaignRepository create(Ref ref) {
    return campaignRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CampaignRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CampaignRepository>(value),
    );
  }
}

String _$campaignRepositoryHash() =>
    r'6d91a3823ab86bddb4458ff266fc97a85cfd25d4';

@ProviderFor(activeCampaigns)
final activeCampaignsProvider = ActiveCampaignsFamily._();

final class ActiveCampaignsProvider
    extends $FunctionalProvider<AsyncValue<dynamic>, dynamic, FutureOr<dynamic>>
    with $FutureModifier<dynamic>, $FutureProvider<dynamic> {
  ActiveCampaignsProvider._({
    required ActiveCampaignsFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'activeCampaignsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$activeCampaignsHash();

  @override
  String toString() {
    return r'activeCampaignsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<dynamic> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<dynamic> create(Ref ref) {
    final argument = this.argument as String?;
    return activeCampaigns(ref, brandId: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveCampaignsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeCampaignsHash() => r'46c708f59aaa06468bc610639b18345ec53eedb3';

final class ActiveCampaignsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<dynamic>, String?> {
  ActiveCampaignsFamily._()
    : super(
        retry: null,
        name: r'activeCampaignsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ActiveCampaignsProvider call({String? brandId}) =>
      ActiveCampaignsProvider._(argument: brandId, from: this);

  @override
  String toString() => r'activeCampaignsProvider';
}
