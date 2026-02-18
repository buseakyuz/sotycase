import 'package:flutter/material.dart';

class LoyaltyCardStack extends StatefulWidget {
  final double totalBalance;
  const LoyaltyCardStack({super.key, required this.totalBalance});

  @override
  State<LoyaltyCardStack> createState() => _LoyaltyCardStackState();
}

class _LoyaltyCardStackState extends State<LoyaltyCardStack>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<String> _cardImages = [
    'assets/card/GoldCard.png',
    'assets/card/BronzCard.png',
    'assets/card/SilverCard.png',
  ];

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
    if (_controller.isAnimating) return;

    setState(() {
      _controller.forward(from: 0).then((_) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _cardImages.length;
          _controller.reset();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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

                  int nextIndex = (_currentIndex + 1) % _cardImages.length;
                  bool showCurrentOnTop = value < 0.5;

                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: showCurrentOnTop
                        ? [
                            _buildCardImage(nextIndex, value, isFront: false),
                            _buildCardImage(
                              _currentIndex,
                              value,
                              isFront: true,
                            ),
                          ]
                        : [
                            _buildCardImage(
                              _currentIndex,
                              value,
                              isFront: true,
                            ),
                            _buildCardImage(nextIndex, value, isFront: false),
                          ],
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_cardImages.length, (index) {
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

  Widget _buildCardImage(int index, double animValue, {required bool isFront}) {
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
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Image.asset(
                _cardImages[index],
                height: 180,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              if (isFront && animValue < 0.1)
                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Toplam Bakiye',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${widget.totalBalance.toInt()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
