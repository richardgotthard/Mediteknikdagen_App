import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/style/colors.dart';
//import 'dart:async';

import '../../icons/custom_app_icons.dart';
import '../../models/companies.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);
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
            children: const [
              Text(
                'Schedule',
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
          ),
        ));
  }
}





        //ListView.builder(
        //     padding: const EdgeInsets.all(20.0),
        //     itemCount: companyItems.length,
        //     itemBuilder: (BuildContext ctx, index) {
        //       final currentComp = companyItems[index];
        //       return GestureDetector(
        //           onTap: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => CompanyScreen(
        //                     image: companyItems[index].path,
        //                     name: companyItems[index].name,
        //                     description: companyItems[index].description,
        //                     location: companyItems[index].location,
        //                     hasExjobb: companyItems[index].hasExjobb,
        //                     hasSommarjobb: companyItems[index].hasSommarjobb,
        //                     hasJobb: companyItems[index].hasJobb),
        //               ),
        //             );
        //           },
        //           child: Container(
        //             padding: const EdgeInsets.all(30.0),
        //             margin: const EdgeInsets.all(10),
        //             alignment: Alignment.center,
        //             decoration: BoxDecoration(
        //               image: DecorationImage(
        //                 image: NetworkImage(currentComp.path),
        //                 fit: BoxFit.cover,
        //               ),
        //             ),
        //             child: Text("Schedule"),
        //           ));
        //     })
            
            
