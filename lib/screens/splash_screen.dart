import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj_amr_ecommerce/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 1. Hide status bar on mount
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // 2. Navigate to Onboarding (2 sec)
    _navigateToOnboarding();
  }

  @override
  void dispose() {
    // 3. Restore status bar before unmount
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Center(
            child: Image.asset(
          'assets/images/logo-w.png',
          height: 150,
        ))
      ]),
    );
  }
}
