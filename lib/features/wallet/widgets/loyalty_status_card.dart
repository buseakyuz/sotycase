import 'package:flutter/material.dart';
import 'package:sotycase/product/constants/soty_colors.dart';

class LoyaltyStatusCard extends StatelessWidget {
  const LoyaltyStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bronz Üye',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: SotyColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Güncel Harcama',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const Text(
                '1.100 ₺',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: SotyColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Custom Progress Bar
          Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.15, // Mock progress
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: SotyColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MilestoneLabel(label: '1.000', isReached: true),
              _MilestoneLabel(label: '5.000', isReached: false),
              _MilestoneLabel(label: '100.000', isReached: false),
            ],
          ),
        ],
      ),
    );
  }
}

class _MilestoneLabel extends StatelessWidget {
  final String label;
  final bool isReached;

  const _MilestoneLabel({required this.label, required this.isReached});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isReached ? SotyColors.primary : Colors.grey.shade400,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 2,
          height: 4,
          color: isReached ? SotyColors.primary : Colors.grey.shade300,
        ),
      ],
    );
  }
}
