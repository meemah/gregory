import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gregory/screens/detail_screen.dart';
import 'package:gregory/screens/home_screen.dart';
import 'package:gregory/utils/app_colors.dart';
import 'package:gregory/viewmodels/detail_viewmodel.dart';
import 'package:gregory/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeViewmodel>(
        create: (context) => HomeViewmodel(),
      ),
      ChangeNotifierProvider<DetailViewmodel>(
        create: (context) => DetailViewmodel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gregory',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black, size: 18),
        ),
        textTheme: GoogleFonts.muliTextTheme(),
        primaryColor: kPrimaryColor,

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
