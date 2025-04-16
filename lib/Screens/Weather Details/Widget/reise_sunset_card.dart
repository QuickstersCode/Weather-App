import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Widgets/container_color.dart';

class SunriseSunsetCard extends StatelessWidget {
  const SunriseSunsetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerColor(
      width: MediaQuery.of(context).size.width / 2 - 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.wb_twighlight, color: Colors.white70, size: 16),
              SizedBox(width: 6),
              Text(
                'SUNRISE',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '5:28 AM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            child: CustomPaint(
              painter: SunriseCurvePainter(),
              child: const SizedBox.expand(),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Sunset: 7:25PM',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class SunriseCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint curvePaint =
        Paint()
          ..color = Colors.blue.shade300
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    final Path curvePath = Path();
    curvePath.moveTo(0, size.height * 0.6);
    curvePath.quadraticBezierTo(
      size.width / 2,
      size.height * 0.05,
      size.width,
      size.height * 0.6,
    );
    canvas.drawPath(curvePath, curvePaint);

    // Draw the dot
    final double dotX = size.width * 0.22;
    final double dotY = size.height * 0.4;

    final Paint glowPaint =
        Paint()
          ..color = Colors.purpleAccent.withOpacity(0.4)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(Offset(dotX, dotY), 8, glowPaint);

    final Paint dotPaint = Paint()..color = Colors.purpleAccent;
    canvas.drawCircle(Offset(dotX, dotY), 6, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
