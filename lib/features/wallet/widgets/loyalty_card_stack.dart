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
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _swapCards() {
    if (_controller.isAnimating || widget.summary == null) return;

    setState(() {
      _controller.forward(from: 0).then((_) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % 3;
          _controller.reset();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.summary == null) return const SizedBox.shrink();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          _swapCards();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 240,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final double value = _animation.value;

                  int nextIndex = (_currentIndex + 1) % 3;
                  bool showCurrentOnTop = value < 0.5;

                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: showCurrentOnTop
                        ? [
                            _buildCard(nextIndex, value, isFront: false),
                            _buildCard(_currentIndex, value, isFront: true),
                          ]
                        : [
                            _buildCard(_currentIndex, value, isFront: true),
                            _buildCard(nextIndex, value, isFront: false),
                          ],
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final bool isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  height: isActive ? 12 : 6,
                  width: 4,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.grey[800] : Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(int index, double animValue, {required bool isFront}) {
    double top;
    double scale;
    double opacity;

    if (isFront) {
      top = 40 - (animValue * 40);
      scale = 1.0 - (animValue * 0.15);
      opacity = 1.0 - (animValue * 0.3);
    } else {
      top = (animValue * 40);
      scale = 0.85 + (animValue * 0.15);
      opacity = 0.7 + (animValue * 0.3);
    }

    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: Transform.scale(
          scale: scale,
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image:
                  widget.summary?.walletCover != null &&
                      widget.summary!.walletCover!.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(widget.summary!.walletCover!),
                      fit: BoxFit.cover,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black.withValues(alpha: 0.1),
                        Colors.black.withValues(alpha: 0.4),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Image.network(
                              widget.summary?.brandLogo ?? '',
                              height: 25,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.business,
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                          const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                      if (isFront && animValue < 0.1)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Toplam Soty Coin',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${widget.summary?.totalAvailableCoin?.toInt() ?? 0}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
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
