import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:sotycase/features/store/providers/coin_usage_provider.dart';
import '../providers/campaign_selection_provider.dart';
import '../../../../product/constants/soty_colors.dart';

class PaymentView extends ConsumerStatefulWidget {
  const PaymentView({super.key});

  @override
  ConsumerState<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Timer _timer;
  int _remainingSeconds = 60;
  String _currentCode = "165 845"; // Mock dinamik kod

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        _refreshCode();
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _refreshCode() {
    setState(() {
      _remainingSeconds = 60;
      // Gerçek senaryoda burada API'den yeni kod istenir
      _currentCode = (100000 + (900000 * (DateTime.now().millisecond / 1000)))
          .toInt()
          .toString();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCampaigns = ref.watch(campaignSelectionProvider);
    final usedCoinAmount = ref.watch(coinUsageProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Mağaza Alışverişi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. QR / Barkod Tab Bar
            _buildCustomTabBar(),

            // 2. Coin Bilgi Kartı
            _buildCoinInfoCard(usedCoinAmount),

            // 3. QR/Barkod Alanı
            _buildCodeDisplayArea(),

            // 4. Kullanılan Kampanyalar Özeti
            if (selectedCampaigns.isNotEmpty)
              _buildCampaignSummary(selectedCampaigns.toList()),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        labelColor: SotyColors.primary,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(text: 'QR'),
          Tab(text: 'Barkod'),
        ],
      ),
    );
  }

  Widget _buildCoinInfoCard(double amount) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: SotyColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.monetization_on,
                color: Color(0xFFD97706),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                '${amount.toInt()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            'Soty Coin Kullanılacaktır.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeDisplayArea() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            _remainingSeconds > 0
                ? "QR kod $_remainingSeconds saniye sonra yenilenecektir"
                : "Yenileniyor...",
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                QrImageView(data: _currentCode, size: 200),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: _currentCode,
                  width: 200,
                  height: 100,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildCodeNumberArea(),
        ],
      ),
    );
  }

  Widget _buildCodeNumberArea() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _currentCode,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: SotyColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.copy, color: SotyColors.primary),
        ),
      ],
    );
  }

  Widget _buildCampaignSummary(List campaigns) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Kullanılan Kampanyalar",
              style: TextStyle(
                color: SotyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ...campaigns.map((c) => _buildMiniCampaignCard(c)).toList(),
        ],
      ),
    );
  }

  Widget _buildMiniCampaignCard(dynamic c) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  c.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: SotyColors.primary, size: 20),
        ],
      ),
    );
  }
}
