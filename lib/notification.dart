/*import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("message recieved 123");
  if (message.data.containsKey('data')) {
    // Handle data message
    final data = message.data['data'];
    print(data);
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    final notification = message.data['notification'];
    print(notification);
  }
  // Or do other work.
}

class FCM {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();

  setNotifications(void Function(int) changePage) {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        print("message recieved 123");
        if (message.data.containsKey('goTo')) {
          // Handle data message
          final data = message.data['goTo'];
          print(data);
        }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          streamCtlr.sink.add(message.data['notification']);
          print(message.data[message.data['notification']]);
        }
        // Or do other work.
        titleCtlr.sink.add(message.notification!.title!);
        bodyCtlr.sink.add(message.notification!.body!);
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked! 123');
      print(message.data);
      if (message.data.containsKey('goTo')) {
        // Handle data message
        final data = message.data['goTo'];
        if (data == "order") {
          changePage(2);
        }
      }
    });
    // With this token you can test it easily on your phone
    final token =
        _firebaseMessaging.getToken().then((value) => print('Token: $value'));
  }

  void fcmSubscribe(String topic) {
    print("Subscribed to " + topic);
    _firebaseMessaging.subscribeToTopic(topic);
  }

  void fcmUnSubscribe(String topic) {
    print("Unsubscribed to " + topic);
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  dispose() {
    streamCtlr.close();
    bodyCtlr.close();
    titleCtlr.close();
  }
}
*/