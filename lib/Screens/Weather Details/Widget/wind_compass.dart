import 'package:flutter/material.dart';
import 'dart:math';

import 'package:weather_app/Screens/Widgets/container_color.dart';

class WindCompass extends StatelessWidget {
  final double windSpeed; // in km/h
  final double direction; // in degrees, 0 = North

  const WindCompass({
    Key? key,
    required this.windSpeed,
    required this.direction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ContainerColor(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.air, color: Colors.white, size: 20),
              SizedBox(width: 5),
              Text("WIND", style: TextStyle(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: 180,
            height: 130,
            child: CustomPaint(
              painter: CompassPainter(direction),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      windSpeed.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("km/h", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompassPainter extends CustomPainter {
  final double direction;

  CompassPainter(this.direction);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke;

    // Draw circle
    canvas.drawCircle(center, radius - 5, paint);

    // Directions
    const directions = ['N', 'E', 'S', 'W'];
    for (int i = 0; i < 4; i++) {
      final angle = (pi / 2) * i;
      final dx = center.dx + cos(angle) * (radius - 20);
      final dy = center.dy + sin(angle) * (radius - 20);
      final textPainter = TextPainter(
        text: TextSpan(
          text: directions[i],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(dx - textPainter.width / 2, dy - textPainter.height / 2),
      );
    }

    // Add tick marks
    for (int i = 0; i < 360; i += 6) {
      final tickAngle = (i - 90) * pi / 180;
      final tickStart = Offset(
        center.dx + cos(tickAngle) * (radius - 5),
        center.dy + sin(tickAngle) * (radius - 5),
      );
      final tickEnd = Offset(
        center.dx + cos(tickAngle) * (radius - (i % 30 == 0 ? 15 : 10)),
        center.dy + sin(tickAngle) * (radius - (i % 30 == 0 ? 15 : 10)),
      );
      canvas.drawLine(tickStart, tickEnd, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
