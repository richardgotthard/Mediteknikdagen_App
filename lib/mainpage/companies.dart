import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/style/colors.dart';
//import 'dart:async';

import '../icons/custom_app_icons.dart';
import '../models/companies.dart';

class Companies extends StatelessWidget {
  const Companies({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            padding: const EdgeInsets.all(20.0),
            itemCount: companyItems.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
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
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(currentComp.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(companyItems[index].name),
                  ));
            }));
  }
}
