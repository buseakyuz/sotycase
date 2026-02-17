import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/campaign_model.dart';

part 'campaign_selection_provider.g.dart';

@riverpod
class CampaignSelection extends _$CampaignSelection {
  @override
  Set<CampaignModel> build() {
    return {}; // Başlangıç state'i boş bir settir
  }

  void toggleCampaign(CampaignModel campaign, {required bool confirmed}) {
    if (state.contains(campaign)) {
      state = {...state}..remove(campaign);
      return;
    }

    if (state.isEmpty) {
      state = {campaign};
      return;
    }

    final hasNonCombinable = state.any((c) => !c.isCombinable);
    final hasCombinable = state.any((c) => c.isCombinable);

    // SENARYO 1 & 2: Çakışma durumunda onaya göre hareket et
    if ((!campaign.isCombinable && hasCombinable) ||
        (campaign.isCombinable && hasNonCombinable)) {
      if (confirmed) {
        state = {campaign}; // Mevcutları temizle, yeniyi ekle
      }
    } else {
      // SENARYO 3: Birleştirilebilirler arasında çoklu seçim
      state = {...state, campaign};
    }
  }

  void clearAll() => state = {};
}
