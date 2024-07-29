import 'package:flutter/material.dart';
import 'package:proj_amr_ecommerce/screens/items_screen.dart';
import 'package:proj_amr_ecommerce/utils/no_animation_page_route.dart';
import 'package:proj_amr_ecommerce/widgets/categories_list_widget.dart';
import 'package:proj_amr_ecommerce/widgets/navbar_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  // // 1. ListView
  // 2. Navigator (CategoriesList, ItemsScreen)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return NoAnimationPageRoute(page: const CategoriesListWidget());
            case '/items':
              return NoAnimationPageRoute(
                page: ItemsScreen(
                    category: (settings.arguments as Map)['category']),
              );
            default:
              return NoAnimationPageRoute(page: const CategoriesListWidget());
          }
        },
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
