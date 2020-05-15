import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wininbahrain/providers/contestHostingProviders.dart';
import 'package:wininbahrain/providers/percentage.dart';
import 'screens/landing_page.dart';
import 'package:wininbahrain/screens/VideoSplashScreen.dart';

void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PercentProvider>.value(value: PercentProvider()),
        ChangeNotifierProvider<ContestHosting>.value(value: ContestHosting())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Win in Bahrain',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: VideoSplashScreen(),
      ),
    );
  }
}

class OnBoardingPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingPage(),
    );
  }
}
