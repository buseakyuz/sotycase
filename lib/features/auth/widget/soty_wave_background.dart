import 'package:flutter/material.dart';
import '../../../../product/constants/soty_colors.dart'; // Dosya yolunu kendi projene göre düzenle

class SotyWaveBackground extends StatelessWidget {
  const SotyWaveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // Ekran yüksekliğini al
    final height = MediaQuery.sizeOf(context).height;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: height * 0.4, // Ekranın alt %40'ını kaplar
      child: ClipPath(
        clipper: const SotyWaveClipper(),
        child: Container(color: SotyColors.primary),
      ),
    );
  }
}

class SotyWaveClipper extends CustomClipper<Path> {
  const SotyWaveClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height * 0.40);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.55,
      size.width,
      0,
    );

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
