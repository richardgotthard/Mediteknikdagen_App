import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

String searchText = '';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchController = "";
  // ignore: prefer_final_fields
  TextEditingController _searchController = TextEditingController();

  CollectionReference allNoteCollection =
      FirebaseFirestore.instance.collection('Companies');
  List<DocumentSnapshot> documents = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
