import 'package:flutter/material.dart';
import 'package:mtd_app/disposed-components/companies.dart';
import 'package:mtd_app/trash/schedule.dart';
import 'package:mtd_app/style/colors.dart';
import 'package:mtd_app/models/category_model.dart';
import 'package:mtd_app/trash/eventScreen.dart';

import 'seemorelist.dart';

List<Route> myRoute = [
  MaterialPageRoute(builder: (_) => const Companies()),
  MaterialPageRoute(builder: (_) => const Schedule()),
  //MaterialPageRoute(builder: (_) => const MapMap()),
  MaterialPageRoute(builder: (_) => const EventScreen()),
];

class AppCategoryList extends StatelessWidget {
  const AppCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeemoreList(),
                    ),
                  );
                },
                child: const Text(
                  'See more',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          margin: const EdgeInsets.only(left: 10, bottom: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final currentCategory = categories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push((myRoute[index]));
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        currentCategory.icon,
                        color: mainColor,
                      ),
                      Text(
                        currentCategory.category,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
