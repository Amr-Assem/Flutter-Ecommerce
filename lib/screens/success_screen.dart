import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:proj_amr_ecommerce/screens/categories_screen.dart';
import 'package:proj_amr_ecommerce/widgets/primary_btn_widget.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(36),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.checkmark_circle_outline,
                  size: 80,
                  color: Colors.green[400],
                ),
                const SizedBox(height: 24),
                Text(
                  "Successful!",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  "You have successfully registered in our app,\nand you can start working in it",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryBtnWidget(
                btnChild: const Text("Start Shopping"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
