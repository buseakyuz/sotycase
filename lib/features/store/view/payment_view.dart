import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
  String _currentCode = "165 845";

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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mağaza Alışverişi'),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCustomTabBar(),
            _buildCoinInfoCard(usedCoinAmount, textTheme),
            _buildCodeDisplayArea(textTheme),
            if (selectedCampaigns.isNotEmpty)
              _buildCampaignSummary(selectedCampaigns.toList(), textTheme),
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
        unselectedLabelColor: SotyColors.textSecondary,
        tabs: const [
          Tab(text: 'QR'),
          Tab(text: 'Barkod'),
        ],
      ),
    );
  }

  Widget _buildCoinInfoCard(double amount, TextTheme textTheme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: SotyColors.primary.withValues(alpha: 0.2)),
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
                style: textTheme.displaySmall?.copyWith(
                  color: SotyColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'Soty Coin Kullanılacaktır.',
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildCodeDisplayArea(TextTheme textTheme) {
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
            style: textTheme.bodySmall,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: QrImageView(data: _currentCode, size: 200)),
                Center(
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: _currentCode,
                    width: 200,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildCodeNumberArea(textTheme),
        ],
      ),
    );
  }

  Widget _buildCodeNumberArea(TextTheme textTheme) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: SotyColors.lightGray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _currentCode,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium?.copyWith(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {}, // Copy functionality
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: SotyColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.copy, color: SotyColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignSummary(List campaigns, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Kullanılan Kampanyalar",
              style: textTheme.titleMedium?.copyWith(
                color: SotyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ...campaigns.map((c) => _buildMiniCampaignCard(c, textTheme)),
        ],
      ),
    );
  }

  Widget _buildMiniCampaignCard(dynamic c, TextTheme textTheme) {
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
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  c.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall,
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
