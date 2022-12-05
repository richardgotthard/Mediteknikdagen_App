// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/category/eventscreen.dart';
import 'package:mtd_app/style/colors.dart';

//För MTD

// ignore: camel_case_types
// class Events_MTD {
//   final String title;
//   final String time;
//   final String date;
//   final String description;

//   Events_MTD({
//     required this.title,
//     required this.time,
//     required this.date,
//     required this.description,
//   });

//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'time': time,
//         'date': date,
//         'description': description,
//       };

//   static Events_MTD fromJson(Map<String, dynamic> json) => Events_MTD(
//         title: json['title'],
//         time: json['time'],
//         date: json['date'],
//         description: json['description'],
//       );
// }

//för preMTD
// ignore: camel_case_types
class Events_preMTD {
  final String title;
  final String time;
  final String date;
  final String description;
  Timestamp sorttime;
  String desc_long;
  String image;
  String url;
  String url_native;
  String link_text;

  Events_preMTD({
    required this.title,
    this.time = "",
    this.date = "",
    this.description = "",
    required this.sorttime,
    this.desc_long = "",
    this.image = "",
    this.url = "",
    this.url_native = "",
    this.link_text = "",
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'time': time,
        'date': date,
        'description': description,
        'sorttime': sorttime,
        'desc_long': desc_long,
        'image': image,
        'url': url,
        'url_native': url_native,
        'link_text': link_text,
      };

  static Events_preMTD fromJson(Map<String, dynamic> json) => Events_preMTD(
        title: json['title'],
        time: json['time'],
        date: json['date'],
        description: json['description'],
        sorttime: json['sorttime'],
        desc_long: json['desc_long'],
        image: json['image'],
        url: json['url'],
        url_native: json['url_native'],
        link_text: json['link_text'],
      );
}

// Stream<List<Events_preMTD>> readEvents_MTD(final String collec) =>
//     FirebaseFirestore.instance
//         .collection(collec)
//         .orderBy("sorttimes")
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//             .map((doc) => Events_preMTD.fromJson(doc.data()))
//             .toList());

Stream<List<Events_preMTD>> readEvents_preMTD() => FirebaseFirestore.instance
    .collection("Events_preMTD")
    .where("isPreMTD", isEqualTo: true)
    .orderBy("sorttime")
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => Events_preMTD.fromJson(doc.data()))
        .toList());

Stream<List<Events_preMTD>> readEvents_MTD() => FirebaseFirestore.instance
    .collection("Events_preMTD")
    .where("isMTD", isEqualTo: true)
    .orderBy("sorttime")
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => Events_preMTD.fromJson(doc.data()))
        .toList());

Future<List> readEvents_MTD_fut() async {
  var notifs = await FirebaseFirestore.instance
      .collection("Events_preMTD")
      .where("isMTD", isEqualTo: true)
      .orderBy("sorttime")
      .get();

  return List<Events_preMTD>.from(
      notifs.docs.map((doc) => Events_preMTD.fromJson(doc.data())).toList());
}

Future<List> readEvents_preMTD_fut() async {
  var notifs = await FirebaseFirestore.instance
      .collection("Events_preMTD")
      .orderBy("sorttime")
      .get();

  return List<Events_preMTD>.from(
      notifs.docs.map((doc) => Events_preMTD.fromJson(doc.data())).toList());
}

// Future<Map> getSomething(String docId) async {
//     CollectionReference campRef = FirebaseFirestore.instance.collection("Events_preMTD");
//     return await campRef.doc(docId).get().then((value) => value.data());
// }

class Event3 extends StatefulWidget {
  const Event3({Key? key}) : super(key: key);

  @override
  State<Event3> createState() => _EventState3();
}

class _EventState3 extends State<Event3> {
  //Stream<List<Events_preMTD>> setEvent = readEvents_preMTD();
  Future<List> setEvent = readEvents_preMTD_fut();

  Color mtd_color = Colors.white;
  Color premtd_color = Colors.deepOrange.withOpacity(0.1);

  String rubrik = "Events";

  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        //SizedBox(
        //height: MediaQuery.of(context).size.height * 0.75, // total height
        flex: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: premtd_color,
                      ),
                      child: const Text(
                        'PreMTD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        setEvent = readEvents_preMTD_fut();
                        premtd_color = Colors.deepOrange.withOpacity(0.1);
                        mtd_color = Colors.white;
                        rubrik = "Events";
                      });
                    }),
                InkWell(
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: mainColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: mtd_color,
                      ),
                      child: const Text(
                        'MTD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        setEvent = readEvents_MTD_fut();
                        premtd_color = Colors.white;
                        mtd_color = Colors.deepOrange.withOpacity(0.1);
                        // rubrik = "Schema";
                      });
                    }),
              ],
            ),
            const Text(
              "Schema",
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
            Expanded(
              child: FutureBuilder<List>(
                  future: setEvent,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text(
                          'Something went wrong!   '); //${snapshot.error}
                    } else if (snapshot.hasData) {
                      var eventsDates = snapshot.data!;
                      var eventsData = snapshot.data!;

                      // Map<int, List> result =
                      //     groupBy(eventsData, (id) => id.date);

                      // Map<String, List> result = eventsData.where((element) {
                      //   return element.date.toString().contains("28 Nov");
                      // }) as Map<String, List>;

                      eventsDates = eventsDates
                          .map((element) {
                            return element.date;
                          })
                          .toSet()
                          .toList();

                      for (var i = 0; i < eventsData.length; i++) {
                        if (eventsDates[i] == eventsData[i].date) {}
                      }

                      var eventsData1 = eventsData.where((element) {
                        return element.date.toString().contains("28 Nov");
                      }).toList();

                      var eventsData2 = eventsData.where((element) {
                        return element.date.toString().contains("29 Nov");
                      }).toList();

                      var eventsData3 = eventsData.where((element) {
                        return element.date.toString().contains("30 Nov");
                      }).toList();

                      var eventsData4 = eventsData.where((element) {
                        return element.date.toString().contains("1 Dec");
                      }).toList();

                      var eventsData5 = eventsData.where((element) {
                        return element.date.toString().contains("2 Dec");
                      }).toList();

                      var eventsData6 = eventsData.where((element) {
                        return element.date.toString().contains("5 Dec");
                      }).toList();

                      List events = [
                        eventsData1,
                        eventsData2,
                        eventsData3,
                        eventsData4,
                        eventsData5,
                        eventsData6,
                      ];

                      // print(eventsDates);

                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: events.length,
                          itemBuilder: (context, index) {
                            final currentEvent = events[index];

                            // for (var i = 0; i < eventsData.length; i++) {
                            //   if (eventsDates[i].toString() ==
                            //       eventsData[i].date.toString()) {
                            //     var currentEvent = events[index];
                            //   }
                            // }
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventScreen(
                                        title: currentEvent.title,
                                        time: currentEvent.time,
                                        date: currentEvent.date,
                                        description: currentEvent.description,
                                        descLong: currentEvent.desc_long,
                                        image: currentEvent.image,
                                        url: currentEvent.url,
                                        urlNative: currentEvent.url_native,
                                        linkText: currentEvent.link_text,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      margin: const EdgeInsets.only(left: 30),
                                      child:
                                          Text(eventsDates[index].toString())),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      // margin: const EdgeInsets.only(
                                      //    top: 4, left: 30, right: 30, bottom: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: mainColor, width: 1),
                                        //  borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                currentEvent.date,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                currentEvent.time,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 180,
                                            margin: const EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  currentEvent.title,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  currentEvent.description,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))
                                ]));
                          });
                    } else {
                      return const Text('Loading...');
                    }
                  }),
            )
          ],
        ));
  }
}
