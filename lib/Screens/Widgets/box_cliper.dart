import 'package:flutter/material.dart';

class BoxCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cornerRadius = 20.0; // Rounded corners

    Path path = Path();

    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    path.lineTo(size.width, size.height / 3);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - cornerRadius,
    );

    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );

    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
