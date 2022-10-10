import 'package:flutter/material.dart';

import 'package:mtd_app/models/category_model.dart';
import 'package:mtd_app/style/colors.dart';
//import 'dart:async';

import '../../icons/custom_app_icons.dart';

List<String> myMTD = [
  "Projektledare",
  "Projektassistent",
  "Koordinator",
  "Föreläsningsansvarig",
  "Mässansvarig",
  "Bankettansvarig",
  "Företagsansvarig",
  "Företagsansvarig",
  "PR-ansvarig",
  "Tryckansvarig",
  "Webbansvarig",
  "Appansvarig",
];

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          title: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                MyFlutterApp.mtd_svart,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          actions: const [
            SizedBox(width: 40, height: 40),
          ],
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Us',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: myMTD.length,
                      itemBuilder: (BuildContext context, i) {
                        final currentMTD = myMTD[i];
                        return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              // color: Colors.grey.withOpacity(0.1),
                            ),
                            child: ListTile(
                              title: Text(
                                currentMTD,
                              ),
                            ));
                      })),
            ],
          ),
        ));
  }
}
