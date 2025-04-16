import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Screens/Home/hourly_Forecast.dart';
import 'package:weather_app/Screens/Home/weekly_forecast.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF612FAB).withOpacity(0.5),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              Color(0xFFC427FB).withOpacity(0.2),
              Color(0xFF612FAB).withOpacity(0.2),
              Color(0xFF2E335A).withOpacity(0.1),
              Color(0xFF000000).withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // stops: [0, 100, 0, 100],
          ),
        ),
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              tabs: [
                Tab(text: "Hourly Forecast"),
                Tab(text: "Weekly Forecast"),
              ],
            ),
            Expanded(
              child: TabBarView(children: [HourlyForecast(), WeeklyForecast()]),
            ),
          ],
        ),
      ),
    );
  }
}
