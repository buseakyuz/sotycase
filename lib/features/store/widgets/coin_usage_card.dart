import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotycase/features/store/models/campaign_model.dart';
import 'package:sotycase/features/store/providers/campaign_selection_provider.dart';
import 'package:sotycase/features/store/providers/coin_usage_provider.dart';
import 'package:sotycase/product/constants/soty_colors.dart';

class CoinUsageCard extends ConsumerWidget {
  final String totalBalance;
  const CoinUsageCard({super.key, required this.totalBalance});

  double _parseBalance() {
    return double.tryParse(totalBalance.replaceAll('.', '')) ?? 0.0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCampaigns = ref.watch(campaignSelectionProvider);
    final currentUsedAmount = ref.watch(coinUsageProvider);
    final balance = _parseBalance();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Soty Coin Kullan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    'Toplam Bakiye: $totalBalance',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Kullanmak istediğiniz toplam Soty Coin miktarının yüzdesini seçiniz.',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        currentUsedAmount > 0
                            ? currentUsedAmount.toInt().toString()
                            : 'Miktar Giriniz',
                        style: TextStyle(
                          color: currentUsedAmount > 0
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildPercentBtn(ref, '%25', balance * 0.25,
                      currentUsedAmount == balance * 0.25),
                  const SizedBox(width: 4),
                  _buildPercentBtn(ref, '%50', balance * 0.50,
                      currentUsedAmount == balance * 0.50),
                  const SizedBox(width: 4),
                  _buildPercentBtn(ref, '%75', balance * 0.75,
                      currentUsedAmount == balance * 0.75),
                  const SizedBox(width: 4),
                  _buildPercentBtn(ref, '%100', balance,
                      currentUsedAmount == balance),
                ],
              ),
            ],
          ),
        ),
        _buildSelectedCampaignChips(ref, selectedCampaigns),
      ],
    );
  }

  Widget _buildPercentBtn(
      WidgetRef ref, String label, double amount, bool isSelected) {
    return InkWell(
      onTap: () {
        ref.read(coinUsageProvider.notifier).setAmount(amount);
      },
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? SotyColors.primary : const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? SotyColors.primary : Colors.grey.shade200,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedCampaignChips(
    WidgetRef ref,
    Set<CampaignModel> selecteds,
  ) {
    if (selecteds.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Wrap(
        spacing: 8,
        children: selecteds
            .map(
              (c) => Chip(
                label: Text(
                  c.title,
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                backgroundColor: SotyColors.primary,
                deleteIcon: const Icon(
                  Icons.close,
                  size: 14,
                  color: Colors.white,
                ),
                onDeleted: () => ref
                    .read(campaignSelectionProvider.notifier)
                    .toggleCampaign(c, confirmed: true),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
