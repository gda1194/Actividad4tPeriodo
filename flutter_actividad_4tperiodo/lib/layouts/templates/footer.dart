import 'package:flutter/material.dart';

Widget footer() {
  List items = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.account_circle_rounded
  ];
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: Color(0xff251B37),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          return IconButton(
            onPressed: () {},
            icon: Icon(
              items[index],
            ),
            iconSize: 25,
          );
        }),
      ),
    ),
  );
}
