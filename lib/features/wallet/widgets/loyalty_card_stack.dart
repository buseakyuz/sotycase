import 'package:flutter/material.dart';
import '../../../product/models/wallet/wallet_summary_model.dart';

class LoyaltyCardStack extends StatefulWidget {
  final WalletSummaryModel? summary;
  const LoyaltyCardStack({super.key, this.summary});

  @override
  State<LoyaltyCardStack> createState() => _LoyaltyCardStackState();
}

class _LoyaltyCardStackState extends State<LoyaltyCardStack>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _swapCards() {
    if (_controller.isAnimating || widget.summary == null) return;
    _controller.forward(from: 0).then((_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 3;
        _controller.reset();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.summary == null) return const SizedBox.shrink();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _swapCards,
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) _swapCards();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 260,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final double value = _animation.value;
                  int nextIndex = (_currentIndex + 1) % 3;

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildCard(nextIndex, value, isFront: false),
                      _buildCard(_currentIndex, value, isFront: true),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            _buildStepIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
        final bool isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: isActive ? 10 : 6,
          width: isActive ? 10 : 6,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF4A5568) : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildCard(int index, double animValue, {required bool isFront}) {
    double topOffset = isFront ? 50 : 20;

    if (isFront) {
      topOffset -= (animValue * 30);
    } else {
      topOffset += (animValue * 30);
    }

    return Positioned(
      top: topOffset,
      left: isFront ? 0 : 20,
      right: isFront ? 0 : 20,
      child: Transform.scale(
        scale: isFront ? (1 - (animValue * 0.05)) : (0.9 + (animValue * 0.1)),
        child: Container(
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: DecorationImage(
              image: NetworkImage(widget.summary?.walletCover ?? ''),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.network(
                          widget.summary?.brandLogo ?? '',
                          height: 48,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(flex: 1),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.stars,
                              color: Colors.white,
                              size: 32,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '${widget.summary?.totalAvailableCoin?.toInt() ?? 0}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bronz Kart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            '1 Soty Coin = 1 ₺',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
