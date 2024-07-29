import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent, // Remove the splash color
                highlightColor:
                    Colors.transparent, // Remove the highlight color
              ),
              child: BottomNavigationBar(
                elevation: 0,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black38,
                currentIndex: _selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                onTap: _onItemTapped,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 92,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                "assets/icons/home.svg",
                                color: Colors.white,
                                height: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Home",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    icon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      color: Colors.black,
                      height: 20,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 84,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                "assets/icons/cart.svg",
                                color: Colors.white,
                                height: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Cart",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    icon: SvgPicture.asset(
                      "assets/icons/cart.svg",
                      color: Colors.black,
                      height: 20,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 84,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                "assets/icons/notification.svg",
                                color: Colors.white,
                                height: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Feed",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    icon: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      color: Colors.black,
                      height: 20,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 90,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                "assets/icons/profile.svg",
                                color: Colors.white,
                                height: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Profile",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    icon: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      color: Colors.black,
                      height: 20,
                    ),
                    label: 'Home',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
