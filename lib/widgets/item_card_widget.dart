import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    super.key,
    required this.item,
  });

  // 1. Item {Image, Title, Description, Price}
  final Map item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "${item['image']}",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: SvgPicture.asset('assets/icons/love.svg', height: 28),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Text(
                  "${item['title']}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  "${item['description']}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  "${item['price']}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
