import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Screens/Home/bottom_sheet.dart';
import 'package:weather_app/Screens/Weather%20Details/Widget/reise_sunset_card.dart';
import 'package:weather_app/Screens/Weather%20Details/Widget/wind_compass.dart';
import 'package:weather_app/Screens/Widgets/container_color.dart';

import 'Widget/air_quality_card.dart';
import 'Widget/pressure_widget .dart';
import 'Widget/rain_fall_widget.dart';
import 'Widget/ui_index_card.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: size.height * 0.20,
                backgroundColor: Colors.transparent,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                "assets/svg/chevronLeft.svg",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Montreal",
                        style: GoogleFonts.lato(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "19°|Mostly Clear",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    30,
                  ), // Smooth Rounded Corners
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ), // Blur Effect
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          0.1,
                        ), // Transparent White
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ), // Soft Border
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 220, child: BuildBottomSheet()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                // const AirQualityCard(),
                                AirQualityCard(
                                  airQualityIndex: 2,
                                  riskLevel: "Low Health Risk",
                                ),

                                const SizedBox(height: 20),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: const [
                                    UvIndexCard(),
                                    SunriseSunsetCard(),
                                    Expanded(
                                      child: WindCompass(
                                        windSpeed: 9.7,
                                        direction: 90,
                                      ),
                                    ), //270 degrees for West

                                    RainfallWidget(
                                      lastHourRain: 1.8,
                                      next24HoursRain: 1.2,
                                    ),

                                    InfoTile(
                                      title: 'FEELS LIKE',
                                      icon: Icons.thermostat,
                                      value: '19°',
                                      subtitle:
                                          'Similar to the actual temperature.',
                                    ),
                                    InfoTile(
                                      title: 'HUMIDITY',
                                      icon:
                                          Icons.opacity, // older, similar icon
                                      value: '90%',
                                      subtitle:
                                          'The dew point is 17 right now.',
                                    ),
                                    InfoTile(
                                      icon:
                                          Icons.opacity, // older, similar icon

                                      title: 'VISIBILITY',
                                      value: '8 km',
                                      subtitle:
                                          'Similar to the actual temperature.',
                                    ),
                                    PressureWidget(
                                      pressureValue: 0.25,
                                    ), // 15% filled
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  const InfoTile({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 26,
      child: ContainerColor(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white70, size: 16),
                SizedBox(width: 6),
                Text(title, style: const TextStyle(color: Color(0xFFA499C0))),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
