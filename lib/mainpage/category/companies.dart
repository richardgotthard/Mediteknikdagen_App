import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/style/colors.dart';
//import 'dart:async';

import '../../icons/custom_app_icons.dart';
import '../../models/companies.dart';

class Companies extends StatelessWidget {
  const Companies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    companyItems.sort((a, b) => a.name.compareTo(b.name));
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
        body: ListView.builder(
            padding: const EdgeInsets.all(20.0),
            itemCount: companyItems.length,
            itemBuilder: (BuildContext ctx, index) {
              final currentComp = companyItems[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyScreen(
                            image: companyItems[index].path,
                            name: companyItems[index].name,
                            description: companyItems[index].description,
                            location: companyItems[index].location,
                            hasExjobb: companyItems[index].hasExjobb,
                            hasSommarjobb: companyItems[index].hasSommarjobb,
                            hasJobb: companyItems[index].hasJobb),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    alignment: Alignment.center,
                    child: Text(currentComp.name),
                  ));
            }));
  }
}
