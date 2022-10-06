import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd_app/style/colors.dart';
import 'package:like_button/like_button.dart';
//import 'dart:async';

import '../icons/custom_app_icons.dart';

DatabaseReference companyref = FirebaseDatabase.instance.ref('companies');

//final _savedPosts

class NotificationScreen extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String location;

  const NotificationScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: const Center(
          child: Icon(
            MyFlutterApp.mtd_svart,
            color: Colors.white,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 40, height: 40),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        constraints: const BoxConstraints(maxHeight: 600),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        // height: 600,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    //    textAlign: start,
                    name,
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 10),
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
