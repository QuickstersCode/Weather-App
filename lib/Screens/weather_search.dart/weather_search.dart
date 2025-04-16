import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Screens/Widgets/box_cliper.dart';
import 'package:weather_app/Screens/Widgets/search_textfield.dart';

class WeatherSearch extends StatelessWidget {
  const WeatherSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset("assets/svg/chevronLeft.svg"),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Weather",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                    SvgPicture.asset("assets/svg/RightTitle.svg"),
                  ],
                ),
                SizedBox(height: 20),
                NeumorphicSearchField(),
                SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipPath(
                              clipper: BoxCliper(),
                              child: Container(
                                height: size.height * 0.20,

                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xff5936B4),
                                      Color(0xFF362A84),
                                    ],
                                  ),
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text inside container
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 20,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "19°",
                                            style: TextStyle(
                                              fontSize: 60,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "H:21°  L:-19°",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFA499C0),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Toronto, Canada",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 35.0,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Mid Rain",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 2,
                              top: -20, // Move more upwards if needed
                              child: Image.asset(
                                "assets/images/cloud1.png",
                                // width: 200, // Optional size
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
