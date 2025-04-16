import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_app/Routes/approutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/languages',
        fallbackLocale: const Locale('en'),
        child: MyApp(),
      ), 
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
          .copyWith(statusBarColor: Colors.transparent));
   
            return MaterialApp(
             debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Flutter',
              initialRoute: AppRoutes.homeScreen,
              routes: AppRoutes.routes,
              
            
            );
          });
    
  }
}


