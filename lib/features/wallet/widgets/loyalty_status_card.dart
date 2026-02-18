import 'package:flutter/material.dart';
import 'package:sotycase/product/models/wallet/wallet_summary_model.dart';
import '../../../../product/constants/soty_colors.dart';

class LoyaltyStatusCard extends StatelessWidget {
  final WalletSummaryModel? summary;
  const LoyaltyStatusCard({super.key, this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.emoji_events_outlined,
                    color: Colors.orange,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Bronz Üye',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
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
                'Kullanılabilir Coin',
                '${summary?.usableBalance.toInt() ?? 0}',
                icon: Icons.monetization_on_outlined,
              ),
              _buildInfoColumn(
                'Toplam Coin',
                '${summary?.totalBalance.toInt() ?? 0}',
                isBoldValue: true,
              ),
            ],
          ),
          const SizedBox(height: 24),

          const _LoyaltyProgressBar(),
          const SizedBox(height: 24),

          const Text(
            'Seviye 2 sadakat kartının sunduğu ayrıcalıklar;',
            style: TextStyle(
              color: SotyColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),

          _buildDetailRow('Avantaj:', '%5 indirim'),
          const SizedBox(height: 8),
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
    bool isBoldValue = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: SotyColors.primary),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w800,
            color: const Color(0xFF2D3748),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String title, String desc) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 12, color: Color(0xFF4A5568)),
        children: [
          TextSpan(text: '$title '),
          TextSpan(
            text: desc,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _LoyaltyProgressBar extends StatelessWidget {
  const _LoyaltyProgressBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.25,
              child: Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A5568),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStep(isActive: true, isReached: true),
                _buildStep(isActive: false, isReached: false),
                _buildStep(isActive: false, isReached: false),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
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

  Widget _buildStep({required bool isActive, required bool isReached}) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: isReached ? const Color(0xFF68D391) : Colors.grey.shade300,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: isReached
          ? const Icon(Icons.check, size: 14, color: Colors.white)
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
            style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
          ),
      ],
    );
  }
}
