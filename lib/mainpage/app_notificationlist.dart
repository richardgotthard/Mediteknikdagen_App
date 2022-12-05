import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/notificationscreen.dart';

class Notification {
  final String title;
  final String description;
  String linktitle;
  String link;
  String image;
  String url;

  String urlNative;
  //Timestamp sorttime;

  Notification({
    required this.title,
    required this.description,
    this.linktitle = '',
    this.link = '',
    this.image = '',
    this.url = '',
    this.urlNative = '',
    // required this.sorttime,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'linktitle': linktitle,
        'link': link,
        'image': image,
        'url': url,
        'url_native': urlNative,
        //  'sorttime': sorttime,
      };

  static Notification fromJson(Map<String, dynamic> json) => Notification(
        title: json['title'],
        description: json['description'],
        linktitle: json['link_text'],
        link: json['bottom_text'],
        image: json['image'],
        url: json['url'],
        urlNative: json['url_native'],
        //  sorttime: json['sorttime'],
      );
}

Stream<List<Notification>> readNotificationStream() => FirebaseFirestore
    .instance
    .collection("Notifications")
    .orderBy("sorttime", descending: true)
    .snapshots(includeMetadataChanges: true)
    .map((snapshot) =>
        snapshot.docs.map((doc) => Notification.fromJson(doc.data())).toList());

Future<List> readNotificationFut() async {
  var notifs = await FirebaseFirestore.instance
      .collection("Notifications")
      .orderBy("sorttime", descending: true)
      .get();

  return List<Notification>.from(
      notifs.docs.map((doc) => Notification.fromJson(doc.data())).toList());
}

Widget buildNotification(Notification notification) => Container(
      alignment: Alignment.center,
      color: Colors.grey.withOpacity(0.2),
      child: Text(notification.title),
    );

class AppMountListView extends StatefulWidget {
  const AppMountListView({Key? key}) : super(key: key);

  @override
  State<AppMountListView> createState() => _AppMountListViewState();
}

class _AppMountListViewState extends State<AppMountListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: StreamBuilder<List>(
            stream: readNotificationStream(),
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
                              url: currentNotif.url,
                              urlNative: currentNotif.urlNative,
                              //   sorttime: currentNotif.sorttime,
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
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(10, 10),
                                blurRadius: 10),
                          ],
                          image: DecorationImage(
                            image:
                                CachedNetworkImageProvider(currentNotif.image),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currentNotif.link,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
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

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
  // DateTime date = DateTime.fromMicrosecondsSinceEpoch( 
  //  
  //
  ////     currentNotif.sorttime.microsecondsSinceEpoch);
  // final birthday = DateTime(date.year, date.month, date.day);
  // final date2 = DateTime.now();
  //   // final difference = daysBetween(birthday, date2);

  // LayoutBuilder(
  //   builder: (BuildContext, BoxConstraints) {
  //     if (difference.toString() == "" ||
  //         difference.toString() == "0") {
  //       return const SizedBox.shrink();
  //     } else {
  //       return Text(
  //         // "${birthday.day} / ${birthday.month}",
  //         "$difference dagar sen",
  //         style: const TextStyle(
  //             color: Colors.black),
  //       );
  //     }
  //   },
  // ),