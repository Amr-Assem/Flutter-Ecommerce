import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.category,
  });

  // 1. Category {Icon, Title, Products}
  final Map category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 16),
      // 2.PushNamed (::category)
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/items',
            arguments: {'category': category},
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 80),
            textStyle: Theme.of(context).textTheme.titleMedium,
            shadowColor: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(category['icon'], size: 32),
              const SizedBox(width: 16),
              Text("${category['title']}"),
              const Spacer(),
              Text(
                "${category['products']} Products",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
