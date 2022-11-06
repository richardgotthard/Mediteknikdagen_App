// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';

//För MTD

// ignore: camel_case_types
class Events_MTD {
  final String title;
  final String time;
  final String date;
  final String description;

  Events_MTD({
    required this.title,
    required this.time,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'time': time,
        'date': date,
        'description': description,
      };

  static Events_MTD fromJson(Map<String, dynamic> json) => Events_MTD(
        title: json['title'],
        time: json['time'],
        date: json['date'],
        description: json['description'],
      );
}

//för preMTD
// ignore: camel_case_types
class Events_preMTD {
  final String title;
  final String time;
  final String date;
  final String description;
  // String image;

  Events_preMTD({
    required this.title,
    required this.time,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'time': time,
        'date': date,
        'description': description,
      };

  static Events_preMTD fromJson(Map<String, dynamic> json) => Events_preMTD(
        title: json['title'],
        time: json['time'],
        date: json['date'],
        description: json['description'],
      );
}

Stream<List<Events_preMTD>> readEvents_MTD(String collec) =>
    FirebaseFirestore.instance
        .collection(collec)
        .orderBy("sorttime")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Events_preMTD.fromJson(doc.data()))
            .toList());

Stream<List<Events_preMTD>> readEvents_preMTD() => FirebaseFirestore.instance
    .collection("Events_preMTD")
    .orderBy("sorttime")
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => Events_preMTD.fromJson(doc.data()))
        .toList());

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  String setEvent = "Events_preMTD";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                  color: Colors.grey.withOpacity(0.1),
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
                  setEvent = "Events_preMTD";
                });
              }),
          InkWell(
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
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
                  setEvent = "Events_MTD";
                });
              }),
        ],
      ),
      const Text(
        "Events",
        style: TextStyle(color: Colors.black, fontSize: 50),
      ),
      SizedBox(
          height: 500,
          child: StreamBuilder<List<Events_preMTD>>(
              stream: readEvents_MTD(setEvent),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                      'Something went wrong!   '); //${snapshot.error}
                } else if (snapshot.hasData) {
                  final eventsData = snapshot.data!;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final currentEvent = eventsData[index];
                      return Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(
                              top: 4, left: 50, right: 50, bottom: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LayoutBuilder(builder: (context, constraints) {
                            if (setEvent == "Events_preMTD") {
                              return Row(
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
                                    width: 120,
                                    margin: const EdgeInsets.only(
                                      left: 20,
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
                              );
                            } else {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentEvent.time,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        currentEvent.date,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 120,
                                    margin: const EdgeInsets.only(
                                      left: 20,
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
                              );
                            }
                          }));
                    },
                  );
                } else {
                  return const Text('Loading...');
                }
              }))
    ]);
  }
}
