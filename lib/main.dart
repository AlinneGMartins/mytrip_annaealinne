import 'package:flutter/material.dart';
import 'telas/splash_screen.dart';
import 'styles/app_styles.dart';

void main() {
  runApp(const MyTripApp());
}

class MyTripApp extends StatelessWidget {
  const MyTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTrip',
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyles.fundo,
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}