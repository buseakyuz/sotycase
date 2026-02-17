import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white.withValues(alpha: 0.5),
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}
