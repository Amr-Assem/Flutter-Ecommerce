import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proj_amr_ecommerce/screens/welcome_screen.dart';
import 'package:proj_amr_ecommerce/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  // 1. OnboardingWidget+
  List<OnboardingWidget> onboardingScreens = [
    const OnboardingWidget(
      img: 'assets/images/board-1.jpg',
      title: "20% Discount\nNew Arrival Product",
    ),
    const OnboardingWidget(
      img: 'assets/images/board-2.jpg',
      title: "Take Advantage\nOf The Offer Shopping",
    ),
    const OnboardingWidget(
      img: 'assets/images/board-3.jpg',
      title: "All Types Offers\nWithin Your Reach",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          // 2. PageView
          children: [...onboardingScreens],
        ),
        Container(
            alignment: const Alignment(0, 0.86),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  // 3. Page Indicator
                  count: onboardingScreens.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.black,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                FloatingActionButton(
                    key: const Key("nextBtn"),
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        'assets/icons/arrow.svg',
                        color: Colors.white,
                      ),
                    ),
                    // 4. Button (Next / Navigate)
                    onPressed: () {
                      onLastPage
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()),
                            )
                          : _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                    }),
              ],
            )),
      ]),
    );
  }
}
