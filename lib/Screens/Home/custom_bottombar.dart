import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/Screens/Home/bottom_sheet.dart';
import 'package:weather_app/Screens/Widgets/bottombar_painter.dart';
import 'package:weather_app/Screens/Weather%20Details/weather_detail.dart';
import 'package:weather_app/Screens/weather_search.dart/weather_search.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
   // double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30), // Smooth Rounded Corners
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), // Blur Effect
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Transparent White
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ), // Soft Border
              ),
              child: BuildBottomSheet(),
            ),
          ),
        ),

        CustomPaint(
          size: Size(screenWidth, 80), // Fix height for bottom nav
          painter: BottombarPainter(screenWidth),
          child: Container(height: 80), // Fix height for painting
        ),

        // 🔴 **Left Icon Button**
        Positioned(
          left: 20,
          bottom: 20,
          child: SvgPicture.asset("assets/svg/location.svg"),
        ),

        // 🟢 **Right Icon Button**
        Positioned(
          right: 20,
          bottom: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeatherSearch()),
              );
            },
            child: SvgPicture.asset("assets/svg/memu.svg"),
          ),
        ),

        // 🟣 **Floating Action Button**
        Positioned(
          left: (screenWidth / 2) - 28,
          bottom: 10,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF000000), Color(0xFFFFFFFF)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-20, -20),
                      blurRadius: 60,
                      color: Color(0xFF7582F4),
                    ),
                    BoxShadow(
                      offset: Offset(20, 20),
                      blurRadius: 60,
                      color: Color(0xFF7582F4),
                    ),
                  ],
                ),

                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherDetailsScreen(),
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add, color: Colors.deepPurple),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
