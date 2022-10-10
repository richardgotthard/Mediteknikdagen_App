import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/style/colors.dart';
//import 'dart:async';

import '../../icons/custom_app_icons.dart';
import '../../models/companies.dart';

class Event extends StatelessWidget {
  const Event({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Events',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
            Text(
              'Coming soon...',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ));
  }
}
