import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickActionButtons extends StatelessWidget {
  const QuickActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          // Üst Sıra: Online ve Mağaza Butonları
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.language_outlined,
                  title: 'Online',
                  boldTitle: 'Alışveriş',
                  campaignCount: 8,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  icon: Icons.store_outlined,
                  title: 'Mağaza',
                  boldTitle: 'Alışverişi',
                  campaignCount: 12,
                  onTap: () => context.go('/store'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Alt Sıra: SeçilStore Marka Sayfası Kartı
          const _BrandPromotionCard(),
        ],
      ),
    );
  }
}

class _BrandPromotionCard extends StatelessWidget {
  const _BrandPromotionCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // Marka sayfası yönlendirmesi buraya
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
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
        child: Row(
          children: [
            Image.asset(
              'assets/logo/secilstore.png',
              height: 42,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            // Metin Alanı
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SeçilStore Marka Sayfası',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  Text(
                    'SeçilStore kampanyalarını keşfet',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            // Ok İkonu
            Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String boldTitle;
  final int campaignCount;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.title,
    required this.boldTitle,
    required this.campaignCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
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
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(icon, color: const Color(0xFF4A5568), size: 32),
                  const SizedBox(width: 8),
                  Container(width: 1, height: 30, color: Colors.grey.shade300),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF4A5568),
                          ),
                        ),
                        Text(
                          boldTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D3748),
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF718096),
                  ),
                  children: [
                    const TextSpan(text: 'Sana özel '),
                    TextSpan(
                      text: '$campaignCount',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const TextSpan(text: ' kampanya'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
