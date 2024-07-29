import 'package:flutter/material.dart';
import 'package:proj_amr_ecommerce/widgets/appbar_widget.dart';
import 'package:proj_amr_ecommerce/widgets/item_card_widget.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({
    super.key,
    required this.category,
  });

  // 1. category {Title, ProductsList}
  final Map category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2. AppbarWidget+
          const AppbarWidget(),
          // 3. Category Title
          Text(
            "${category['title']}",
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Expanded(
            // 3. GridView.builder (ProductList --> ItemCardWidget+)
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              padding: const EdgeInsetsDirectional.all(0),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                // 4. ItemCardWidget+ (::item)
                return ItemCardWidget(
                  item: category['productList'][index],
                );
              },
              // Dynamic GridView
              itemCount: category['productList'].length,
            ),
          )
        ],
      ),
    );
  }
}
