import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Screens/Home/custom_bottombar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: size.height * 500,
                  backgroundColor: Colors.transparent,
                  floating: true,
                  pinned: true,
                  flexibleSpace: Column(
                    children: [
                      const SizedBox(height: 80),
                      
                      Text(
                        "Montreal",
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.08,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "19°",
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.2,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Mostly Clear",
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.05,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "H:24°   L:18°",
                        style: GoogleFonts.lato(
                          fontSize: size.width * 0.045,
                          color: Colors.white54,
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),
                      Image.asset('assets/images/house .png'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
