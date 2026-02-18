import 'package:flutter/material.dart';
import 'package:sotycase/product/models/wallet/wallet_summary_model.dart';
import '../../../../product/constants/soty_colors.dart';

class LoyaltyStatusCard extends StatelessWidget {
  final WalletSummaryModel? summary;
  const LoyaltyStatusCard({super.key, this.summary});

  @override
  Widget build(BuildContext context) {
    const double spentAmount = 1100;
    const List<double> tiers = [0, 1000, 5000, 100000];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sadakat Seviyen:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.emoji_events_outlined,
                    color: Color(0xFFF6AD55),
                    size: 22,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Bronz Üye',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: SotyColors.primary),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn(
                'Son Gün',
                '31 ARALIK',
                icon: Icons.access_time_filled,
              ),
              _buildInfoColumn(
                'Harcanan TL',
                '${spentAmount.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')} ₺',
                alignRight: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const _LoyaltyProgressBar(currentAmount: spentAmount, tiers: tiers),
          const SizedBox(height: 32),
          const Text(
            'Seviye 2 sadakat kartının sunduğu ayrıcalıklar;',
            style: TextStyle(
              color: SotyColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow('Avantaj:', '%5 indirim'),
          const SizedBox(height: 10),
          _buildDetailRow(
            'Yükselme Kriteri:',
            'Her ₺500 alışverişte ₺20 kupon',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
    String label,
    String value, {
    IconData? icon,
    bool alignRight = false,
  }) {
    return Column(
      crossAxisAlignment: alignRight
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: SotyColors.primary),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFFA0AEC0)),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A202C),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String title, String desc) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Color(0xFF4A5568)),
        children: [
          TextSpan(
            text: '$title ',
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: desc,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoyaltyProgressBar extends StatelessWidget {
  final double currentAmount;
  final List<double> tiers;

  const _LoyaltyProgressBar({required this.currentAmount, required this.tiers});

  double _calculateProgress() {
    if (tiers.isEmpty) return 0;
    if (currentAmount <= tiers.first) return 0;
    if (currentAmount >= tiers.last) return 1;

    for (int i = 0; i < tiers.length - 1; i++) {
      if (currentAmount >= tiers[i] && currentAmount < tiers[i + 1]) {
        double segmentProgress =
            (currentAmount - tiers[i]) / (tiers[i + 1] - tiers[i]);
        return (i + segmentProgress) / (tiers.length - 1);
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final double progress = _calculateProgress();

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: SotyColors.gray.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: SotyColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Steps
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tiers.map((tier) {
                return Opacity(
                  opacity: tier > 1 ? 1 : 0,
                  child: _buildStep(isReached: currentAmount >= tier),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStepText('0', ''),
            _buildStepText('1.000 ₺', '(Seviye 2)'),
            _buildStepText('5.000 ₺', '(Seviye 3)'),
            _buildStepText('100.000 ₺', '(Seviye 4)'),
          ],
        ),
      ],
    );
  }

  Widget _buildStep({required bool isReached}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isReached ? const Color(0xFF68D391) : const Color(0xFFCBD5E0),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: isReached
          ? const Icon(Icons.check, size: 16, color: Colors.white)
          : null,
    );
  }

  Widget _buildStepText(String amount, String level) {
    return Column(
      children: [
        Text(
          amount,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3748),
          ),
        ),
        if (level.isNotEmpty)
          Text(
            level,
            style: const TextStyle(fontSize: 10, color: Color(0xFFA0AEC0)),
          ),
      ],
    );
  }
}
