import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proj_amr_ecommerce/screens/categories_screen.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size(48, 48),
                  maximumSize: const Size(48, 48),
                  padding: const EdgeInsets.all(0)),
              child: SvgPicture.asset(
                'assets/icons/back.svg',
                color: Colors.white,
                width: 24,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoriesScreen()),
                );
              },
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  minimumSize: const Size(48, 48),
                  maximumSize: const Size(48, 48),
                  padding: const EdgeInsets.all(0)),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                color: Colors.black,
                width: 24,
              ),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
