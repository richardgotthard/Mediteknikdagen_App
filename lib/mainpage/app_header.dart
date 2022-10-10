import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/settings.dart';

import '../style/colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            ClipOval(
              child: Image.file(
                File('/Users/richard/GitHub/mtd_app/assets/icon/appstore.png'),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello,',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  'and good morning',
                  //'Welcome to the Fair',
                  style: TextStyle(color: mainColor, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
              child: const Icon(
                Icons.settings,
                color: mainColor,
              ),
            )),
      ]),
    );
  }
}
