import 'package:flutter/material.dart';

class ContainerColor extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  const ContainerColor({
    super.key,
    this.height,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.22,
      width: width ?? MediaQuery.of(context).size.width / 2 - 26,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2e2158),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(0xff545cab), width: 0.5),
      ),
      child: child,
    );
  }
}
