import 'package:flutter/material.dart';
import 'package:proj_amr_ecommerce/screens/signin_screen.dart';
import 'package:proj_amr_ecommerce/screens/signup_screen.dart';
import 'package:proj_amr_ecommerce/widgets/primary_btn_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/splash-1.png',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Center(
          child: Image.asset(
            'assets/images/logo-w.png',
            height: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 1. Navigate (Push)
              // 2. PrimaryBtnWidget+
              PrimaryBtnWidget(
                btnBgColor: Colors.white,
                btnTxtColor: Colors.black,
                btnChild: const Text("Login"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SigninScreen()),
                  );
                },
              ),
              PrimaryBtnWidget(
                btnBgColor: Colors.transparent,
                btnBorderColor: Colors.white,
                btnChild: const Text("Sign Up"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (const SignupScreen()),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
