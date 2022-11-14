//Notifications in progress
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:mtd_app/navigation_not.dart';

// import 'mainpage/notificationscreen.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  //("message recieved 123");
  if (message.data.containsKey('data')) {
    // Handle data message
    // final data = message.data['data'];
    // print(data);
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    // final notification = message.data['notification'];
    // print(notification);
  }
  // Or do other work.
}

class FCM {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();

  setPermission() async {
    // ignore: unused_local_variable
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future addToNotification(String title, String description, String linktitle,
      String link, String image) async {
    return FirebaseFirestore.instance.collection("Notifications").doc().set({
      'title': title,
      'description': description,
      'linktitle': linktitle,
      'link': link,
      'image': image,
    });
  }

  // message.

  //void Function(int) changePage for changing tabs
  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        //print("message recieved 123");
        if (message.data.containsKey('goTo')) {
          // Handle data message
          // final data = message.data['goTo'];
          //print(data);
        }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          streamCtlr.sink.add(message.data['notification']);
          // print(message.data[message.data['notification']]);
        }
        // Or do other work.
        titleCtlr.sink.add(message.notification!.title!);
        bodyCtlr.sink.add(message.notification!.body!);
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
     // RemoteNotification? notification = message.notification;
     // AndroidNotification? android = message.notification?.android;
      //print('Message clicked! 123');
      //print(message.data);
      // if (message.data.containsKey('goTo')) {
      //   // Handle data message
      //   final data = message.data['goTo'];
      //   if (data == "order") {
      //     Map<String, dynamic> currentNotif = message.data;
      //     Navigator.push(
      //       NavigationService.navigatorKey.currentContext!,
      //       MaterialPageRoute(
      //         builder: (context) => NotificationScreen(
      //           image: currentNotif.image,
      //           title: currentNotif.title,
      //           description: currentNotif.description,
      //           link: currentNotif.link,
      //           linktitle: currentNotif.linktitle,
      //         ),
      //       ),
      //     );
      //   }
      // }
    });
    // With this token you can test it easily on your phone
    //final token =
    //  _firebaseMessaging.getToken().then((value) => print('Token: $value'));
  }

  void fcmSubscribe(String topic) {
    //print("Subscribed to " + topic);
    _firebaseMessaging.subscribeToTopic(topic);
  }

  void fcmUnSubscribe(String topic) {
    //print("Unsubscribed to " + topic);
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  dispose() {
    streamCtlr.close();
    bodyCtlr.close();
    titleCtlr.close();
  }
}
