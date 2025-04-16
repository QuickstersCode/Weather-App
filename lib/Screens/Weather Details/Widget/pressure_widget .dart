import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Widgets/container_color.dart';

class PressureWidget extends StatelessWidget {
  final double pressureValue; 

  const PressureWidget({Key? key, required this.pressureValue})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerColor(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Label
          const Row(
            children: [
              Icon(Icons.speed, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text(
                "PRESSURE",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Custom Circular Bar
          SizedBox(
            width: 100,
            height: 100,
            child: CustomPaint(painter: PressureDialPainter(pressureValue)),
          ),
        ],
      ),
    );
  }
}

class PressureDialPainter extends CustomPainter {
  final double progress;

  PressureDialPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 5;
    final tickCount = 48;
    final tickPaint =
        Paint()
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;

    for (int i = 0; i < tickCount; i++) {
      final angle = (2 * pi * i) / tickCount;
      final isActive = i / tickCount <= progress;

      tickPaint.color = isActive ? Colors.white : Colors.grey.shade700;

      final start = Offset(
        center.dx + cos(angle) * (radius - 6),
        center.dy + sin(angle) * (radius - 6),
      );
      final end = Offset(
        center.dx + cos(angle) * radius,
        center.dy + sin(angle) * radius,
      );

      canvas.drawLine(start, end, tickPaint);
    }

    // Draw top needle/line based on progress
    final needleAngle = (progress * 2 * pi) - pi / 2; // start from top
    final needleStart = Offset(
      center.dx + cos(needleAngle) * (radius - 15),
      center.dy + sin(needleAngle) * (radius - 15),
    );
    final needleEnd = Offset(
      center.dx + cos(needleAngle) * (radius + 2),
      center.dy + sin(needleAngle) * (radius + 2),
    );

    canvas.drawLine(
      needleStart,
      needleEnd,
      Paint()
        ..color = Colors.white
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
