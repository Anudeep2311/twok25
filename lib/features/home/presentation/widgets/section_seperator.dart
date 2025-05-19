import 'package:flutter/material.dart';

class SectionSeparator extends StatelessWidget {
  final Color color;
  final double height;

  const SectionSeparator({
    super.key,
    this.color = const Color(0xFFF5F7FA),
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CurveClipper(),
      child: Container(
        color: color,
        height: height,
      ),
    );
  }
}

class _CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 40,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
