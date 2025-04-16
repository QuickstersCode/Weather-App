import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Models/hourly_forecast_model.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    List<HourlyForecastModel> foreCasteData = [
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "19°",
        time: "12 AM",
      ),
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "20°",
        time: "1 AM",
      ),
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "21°",
        time: "2 AM",
      ),
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "22°",
        time: "3 AM",
      ),
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "23°",
        time: "4 AM",
      ),
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "23°",
        time: "4 AM",
      ),
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "23°",
        time: "4 AM",
      ),
      HourlyForecastModel(
        pic: "assets/images/Moon cloud fast wind.png",
        temp: "23°",
        time: "4 AM",
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 170, // ✅ Proper height for visibility
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foreCasteData.length,
            itemBuilder: (context, index) {
              return Container(
                // ✅ Return is added
                width: 70,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3A3A6A), Color(0xFF25244C)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  // color: Colors.transparent,
                  border: Border.all(color: Color(0xff545cab)),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      foreCasteData[index].time,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Image.asset(foreCasteData[index].pic),
                    const SizedBox(height: 5),
                    Text(
                      foreCasteData[index].temp,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
