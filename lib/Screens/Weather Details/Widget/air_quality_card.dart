// import 'package:flutter/material.dart';
// import 'package:weather_app/Screens/Widgets/container_color.dart';

// class AirQualityCard extends StatelessWidget {
//   const AirQualityCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ContainerColor(
//       height: MediaQuery.of(context).size.height * 0.18,
//       width: double.infinity,
//       child: const Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('AIR QUALITY', style: TextStyle(color: Color(0xFFA499C0))),
//           SizedBox(height: 8),
//           Text(
//             '3 - Low Health Risk',
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//           SizedBox(height: 10),
//           LinearProgressIndicator(
//             value: 0.3,
//             color: Colors.pinkAccent,
//             backgroundColor: Colors.grey,
//           ),
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(''),
//               Text('See more', style: TextStyle(color: Colors.white)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Widgets/container_color.dart'
    show ContainerColor;

class AirQualityCard extends StatelessWidget {
  final int airQualityIndex; // e.g., 3
  final String riskLevel; // e.g., "Low Health Risk"

  const AirQualityCard({
    Key? key,
    required this.airQualityIndex,
    required this.riskLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerColor(
      height: MediaQuery.of(context).size.height * 0.20,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: const [
              Icon(
                Icons.blur_on,
                color: Colors.grey,
                size: 16,
              ), // Air quality icon
              SizedBox(width: 6),
              Text(
                "AIR QUALITY",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Risk Label
          Text(
            "$airQualityIndex - $riskLevel",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Gradient Slider (indicator only)
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF5AC8FA),
                      Color(0xFF9B59B6),
                      Color(0xFFF06292),
                    ],
                  ),
                ),
              ),
              Positioned(
                left:
                    (airQualityIndex / 10) *
                    200, // Simulated progress (max width ~300)
                top: -1,
                child: const Icon(Icons.circle, color: Colors.white, size: 8),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // See More
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "See more",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 14),
            ],
          ),
        ],
      ),
    );
  }
}
