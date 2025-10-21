import 'package:flutter/material.dart';
import 'package:mini_taxi_booking_app/screens/home_screen.dart';
import 'package:mini_taxi_booking_app/utils/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Taxi Booking App',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
