import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sotycase/features/store/models/campaign_model.dart';
import 'package:sotycase/features/store/providers/campaign_selection_provider.dart';
import 'package:sotycase/features/store/widgets/campaign_card.dart';
import 'package:sotycase/features/store/widgets/coin_usage_card.dart';

import '../../../../product/constants/soty_colors.dart';

class StoreView extends ConsumerStatefulWidget {
  const StoreView({super.key});

  @override
  ConsumerState<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends ConsumerState<StoreView> {
  final List<CampaignModel> _mockCampaigns = [
    CampaignModel(
      id: "1",
      brandName: "Secil Store",
      title: "Bahar Coşkusuyla Coin Katlama",
      description:
          "Baharı enerjisini alışverişlerine taşı! Şimdi alışveriş yaptıkça kazandığın Soty Coin'ler tam 3 katı değerinde hesabına yansıyor.",
      expiryDate: "01 Temmuz",
      isCombinable: false,
    ),
    CampaignModel(
      id: "2",
      brandName: "Secil Store",
      title: "Tüm Ürünlerde %20 İndirim",
      description:
          "Tüm ürünlerde geçerli %20 indirim fırsatıyla favori ürünlerinizi şimdi daha avantajlı fiyatlarla alın. Kampanya sınırlı süreyle geçerli!",
      expiryDate: "02 Eylül",
      isCombinable: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedCampaigns = ref.watch(campaignSelectionProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/wallet');
            }
          },
        ),
        title: const Text(
          'Mağaza Alışverişi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
        centerTitle: true,
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
          _buildStickyButton(selectedCampaigns),
        ],
      ),
    );
  }

  Widget _buildCampaignList(Set<CampaignModel> selectedCampaigns) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _mockCampaigns.length,
      itemBuilder: (context, index) {
        final campaign = _mockCampaigns[index];
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

  Widget _buildStickyButton(Set<CampaignModel> selectedCampaigns) {
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
          style: ElevatedButton.styleFrom(
            backgroundColor: SotyColors.primary,
            disabledBackgroundColor: const Color(0xFFD1D5DB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code_2, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                hasSelection ? 'QR Kod Oluştur' : 'Kampanyaları Seç',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
