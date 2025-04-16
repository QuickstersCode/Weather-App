import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Widgets/container_color.dart';

class UvIndexCard extends StatelessWidget {
  const UvIndexCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerColor(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.wb_sunny_outlined, color: Colors.white70, size: 18),
              SizedBox(width: 6),
              Text('UV INDEX', style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            '4',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Moderate',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.pinkAccent],
              ),
            ),
            child: Align(
              alignment: Alignment(-0.3, 0), // Position of the white dot
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
