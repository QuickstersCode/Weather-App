import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Widgets/container_color.dart';

class RainfallWidget extends StatelessWidget {
  final double lastHourRain;
  final double next24HoursRain;

  const RainfallWidget({
    Key? key,
    required this.lastHourRain,
    required this.next24HoursRain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerColor(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row - Icon + Title
          Row(
            children: const [
              Icon(Icons.water_drop, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text(
                "RAINFALL",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Rainfall Value
          Text(
            "${lastHourRain.toStringAsFixed(1)} mm",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          // Label
          const Text(
            "in last hour",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          // Future Rainfall Info
          Text(
            "${next24HoursRain.toStringAsFixed(1)} mm expected in\nnext 24h.",
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
