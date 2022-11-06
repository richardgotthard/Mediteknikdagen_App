import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/notificationscreen.dart';

class Notification {
  final String title;
  final String description;
  String linktitle;
  String link;
  String image;

  Notification({
    required this.title,
    required this.description,
    this.linktitle = '',
    this.link = '',
    this.image = '',
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'linktitle': linktitle,
        'link': link,
        'image': image,
      };

  static Notification fromJson(Map<String, dynamic> json) => Notification(
        title: json['title'],
        description: json['description'],
        linktitle: json['link_title'],
        link: json['link'],
        image: json['image'],
      );
}

Stream<List<Notification>> readNotification() => FirebaseFirestore.instance
    .collection("Notifications")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Notification.fromJson(doc.data())).toList());

Widget buildNotification(Notification notification) => Container(
      alignment: Alignment.center,
      color: Colors.grey.withOpacity(0.2),
      child: Text(notification.title),
    );

class AppMountListView2 extends StatelessWidget {
  const AppMountListView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: StreamBuilder<List<Notification>>(
            stream: readNotification(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                    'Something went wrong!  '); //${snapshot.error}
              } else if (snapshot.hasData) {
                final notificationsData = snapshot.data!;

                return ListView.builder(
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final currentNotif = notificationsData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(
                              image: currentNotif.image,
                              title: currentNotif.title,
                              description: currentNotif.description,
                              link: currentNotif.link,
                              linktitle: currentNotif.linktitle,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(currentNotif.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentNotif.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              currentNotif.link,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Text('Loading...');
              }
            }));
  }
}
