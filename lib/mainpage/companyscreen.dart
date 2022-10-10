import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd_app/style/colors.dart';
import 'package:like_button/like_button.dart';
//import 'dart:async';

import '../icons/custom_app_icons.dart';

DatabaseReference companyref = FirebaseDatabase.instance.ref('companies');

//final _savedPosts

class CompanyScreen extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String location;
  final bool hasExjobb;
  final bool hasSommarjobb;
  final bool hasJobb;

  const CompanyScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.location,
      required this.hasExjobb,
      required this.hasSommarjobb,
      required this.hasJobb})
      : super(key: key);

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
        decoration: BoxDecoration(
          border: Border.all(color: mainColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        height: 600,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: AspectRatio(
                aspectRatio: 1.5,
                child: SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(image),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (hasExjobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Exjobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasSommarjobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Sommarjobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasJobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Jobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ],
                  ),
                  Row(
                    children: const [
                      LikeButton(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
