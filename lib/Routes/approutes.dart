import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Home/home.dart';
import 'package:weather_app/Screens/weather_search.dart/weather_search.dart';
import '../Screens/Weather Details/weather_detail.dart';

class AppRoutes {
  static const String homeScreen = '/HomeScreen';
  static const String weatherDetailsScreen = '/WeatherDetailsScreen';
  static const String weatherSearch = '/ WeatherSearch';

  static Map<String, WidgetBuilder> get routes => {
    homeScreen: (_) => HomeScreen(),
    weatherDetailsScreen: (_) => WeatherDetailsScreen(),
    weatherSearch: (_) => WeatherSearch(),
  };
}
