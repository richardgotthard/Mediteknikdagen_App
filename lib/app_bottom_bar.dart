import 'package:flutter/material.dart';

import 'style/colors.dart';
import 'companies.dart';
import 'models/app_bottom_bar_item.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
    );
  }

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  List<AppBottomBarItem> barItems = [
    AppBottomBarItem(icon: Icons.home, isSelected: true),
    AppBottomBarItem(icon: Icons.explore, isSelected: false),
    AppBottomBarItem(icon: Icons.turned_in_not, isSelected: false),
    AppBottomBarItem(icon: Icons.person_outline, isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    PageView(
      controller: _pageController,
      onPageChanged: (index) => (changePage(index)),
      children: <Widget>[
        CompaniesScreen(),
      ],
    );
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(barItems.length, (index) {
          final currentBarItem = barItems[index];

          Widget barItemWidget;

          if (currentBarItem.isSelected) {
            barItemWidget = Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: mainColor,
              ),
              child: Row(
                children: [
                  Icon(currentBarItem.icon, color: Colors.white),
                  const SizedBox(width: 5),
                  Text(
                    currentBarItem.label,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            );
          } else {
            barItemWidget = IconButton(
              icon: Icon(
                currentBarItem.icon,
                color: Colors.grey,
              ),
              onPressed: () {
                (index) => (_pageController.jumpToPage(index));
                setState(() {
                  for (var item in barItems) {
                    item.isSelected = item == currentBarItem;
                  }
                });
              },
            );
          }

          return barItemWidget;
        }),
      ),
    );
  }
}
