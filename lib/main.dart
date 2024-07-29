import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:proj_amr_ecommerce/screens/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Default Theme
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headlineLarge: const TextStyle(
              fontSize: 36, fontWeight: FontWeight.w900, height: 1.2),
          bodyMedium: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, height: 1.3),
          bodySmall: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, height: 1.3),
          titleLarge: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, height: 1.8),
          titleMedium: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, height: 1.3),
          titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
              height: 1.5),
          labelMedium: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              height: 1.5),
        ),
      ),
      // 2. Navigate to Splash
      home: const SplashScreen(),
    );
  }
}
