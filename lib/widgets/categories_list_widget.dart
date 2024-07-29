import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proj_amr_ecommerce/data/categories_data.dart';
import 'package:proj_amr_ecommerce/screens/notifications_screen.dart';
import 'package:proj_amr_ecommerce/utils/no_animation_page_route.dart';
import 'package:proj_amr_ecommerce/widgets/category_card_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Row(
            children: [
              Text(
                "Categories",
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 24),
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
                  'assets/icons/notification.svg',
                  color: Colors.black,
                  width: 24,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    NoAnimationPageRoute(page: const NotificationsScreen()),
                  );
                },
              ),
            ],
          ),
          // 1. ListView.builder (Data --> CategoryCardWidget+)
          ListView.builder(
            padding: const EdgeInsetsDirectional.all(0),
            shrinkWrap: true,
            // 2. CategoryCardWidget+ (::category)
            itemBuilder: (context, int index) => CategoryCardWidget(
              category: categoriesList[index],
            ),
            // 3. Dynamic ListView
            itemCount: categoriesList.length,
          )
        ],
      ),
    );
  }
}
