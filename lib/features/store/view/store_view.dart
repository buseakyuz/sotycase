import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sotycase/features/store/models/campaign_model.dart';
import 'package:sotycase/features/store/providers/campaign_selection_provider.dart';
import 'package:sotycase/features/store/widgets/campaign_card.dart';
import 'package:sotycase/features/store/widgets/coin_usage_card.dart';


class StoreView extends ConsumerStatefulWidget {
  const StoreView({super.key});

  @override
  ConsumerState<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends ConsumerState<StoreView> {
  @override
  Widget build(BuildContext context) {
    final selectedCampaigns = ref.watch(campaignSelectionProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/wallet');
            }
          },
        ),
        title: const Text('Mağaza Alışverişi'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_scanner),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                const CoinUsageCard(totalBalance: "50.000"),
                const SizedBox(height: 16),
                _buildCampaignList(selectedCampaigns),
              ],
            ),
          ),
          _buildStickyButton(selectedCampaigns, textTheme),
        ],
      ),
    );
  }

  Widget _buildCampaignList(Set<CampaignModel> selectedCampaigns) {
    final campaigns = <CampaignModel>[]; // Empty for now until API is ready
    
    if (campaigns.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'Kullanılabilir kampanya bulunmamaktadır.',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final campaign = campaigns[index];
        final isSelected = selectedCampaigns.contains(campaign);

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CampaignCard(
            id: campaign.id,
            brandName: campaign.brandName,
            title: campaign.title,
            description: campaign.description,
            expiryDate: campaign.expiryDate,
            isCombinable: campaign.isCombinable,
            isSelected: isSelected,
            onSelect: () => _onCampaignTap(campaign),
          ),
        );
      },
    );
  }

  void _onCampaignTap(CampaignModel campaign) async {
    final selectedCampaigns = ref.read(campaignSelectionProvider);

    if (selectedCampaigns.contains(campaign)) {
      ref
          .read(campaignSelectionProvider.notifier)
          .toggleCampaign(campaign, confirmed: true);
      return;
    }

    if (selectedCampaigns.isEmpty) {
      ref
          .read(campaignSelectionProvider.notifier)
          .toggleCampaign(campaign, confirmed: true);
      return;
    }

    final hasNonCombinable = selectedCampaigns.any((c) => !c.isCombinable);

    bool showDialog = false;
    String message = "";

    if (!campaign.isCombinable &&
        selectedCampaigns.any((c) => c.isCombinable)) {
      showDialog = true;
      message =
          "Birleştirilemez kampanya seçerseniz, mevcut kampanyalar iptal edilecek. Devam etmek istiyor musunuz?";
    } else if (campaign.isCombinable && hasNonCombinable) {
      showDialog = true;
      message =
          "Birleştirilebilir kampanya seçerseniz, mevcut kampanya iptal edilecek. Devam etmek istiyor musunuz?";
    }

    if (showDialog) {
      final bool? confirm = await _showConfirmationDialog(context, message);
      if (confirm == true) {
        ref
            .read(campaignSelectionProvider.notifier)
            .toggleCampaign(campaign, confirmed: true);
      }
    } else {
      ref
          .read(campaignSelectionProvider.notifier)
          .toggleCampaign(campaign, confirmed: true);
    }
  }

  Future<bool?> _showConfirmationDialog(BuildContext context, String message) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Kampanya Değişimi"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Vazgeç"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Devam Et"),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyButton(Set<CampaignModel> selectedCampaigns, TextTheme textTheme) {
    final bool hasSelection = selectedCampaigns.isNotEmpty;
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: hasSelection
              ? () {
                  context.push("/payment");
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code_2),
              const SizedBox(width: 8),
              Text(
                hasSelection ? 'QR Kod Oluştur' : 'Kampanyaları Seç',
                style: textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
