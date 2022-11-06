import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/models/companies_firebase.dart';

Stream<List<Company>> readCompany() => FirebaseFirestore.instance
    .collection("Companies")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList());

Stream<List<Company>> readCompanySearch(String query) =>
    FirebaseFirestore.instance
        .collection("Companies")
        .where('name', isGreaterThanOrEqualTo: query)
        // ignore: prefer_interpolation_to_compose_strings
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList());

class GridViewer extends StatefulWidget {
  const GridViewer({Key? key}) : super(key: key);

  @override
  State<GridViewer> createState() => _GridViewerState();
}

class _GridViewerState extends State<GridViewer> {
  // ignore: prefer_final_fields
  TextEditingController _searchController = TextEditingController();

  CollectionReference allNoteCollection =
      FirebaseFirestore.instance.collection('Companies');
  List<DocumentSnapshot> documents = [];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upptäck',
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
                        decoration: InputDecoration(
                          //labelText: "Search",
                          border: InputBorder.none,
                          hintText: "Search",
                          hoverColor: Colors.grey[200],
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.black),
                        ),
                      ),
                    ]),
                  ),
                ),
                // Testing for adjusting searchresult
                // InkWell(
                //   child: Container(
                //     margin: const EdgeInsets.only(left: 10),
                //     width: 50,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: mainColor,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: const Icon(
                //       Icons.tune,
                //       color: Colors.white,
                //     ),
                //   ),
                //   onTap: () {
                //     new Row(
                //       children: [Container(child: Text("Exjobb"))],
                //     );
                //   },
                // )
              ],
            ),
          ],
        ),
      ),
      SingleChildScrollView(
          //height: 480,
          child: SizedBox(
              height: 500,
              child: StreamBuilder<List<Company>>(
                  // initialData: readCompany(),
                  stream: readCompany(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text(
                          'Something went wrong!  '); //${snapshot.error}
                    } else if (snapshot.hasData) {
                      var companyss = snapshot.data!;

                      if (searchText.isNotEmpty) {
                        companyss = companyss.where((element) {
                          return element.name
                              .toString()
                              .toLowerCase()
                              .contains(searchText.toLowerCase());
                        }).toList();
                      }

                      companyss.shuffle();

                      return GridView.builder(
                          // shrinkWrap: true,
                          padding: const EdgeInsets.all(20.0),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: companyss.length, //snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final currentComp = companyss[index];
                            final documentid = FirebaseFirestore.instance
                                .collection("Companies")
                                .id
                                .toString();
                            return GestureDetector(onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CompanyScreen(
                                      image: currentComp.image,
                                      id: documentid,
                                      name: currentComp.name,
                                      description: currentComp.description,
                                      hasExjobb: currentComp.hasExjobb,
                                      hasSommarjobb: currentComp.hasSommarjobb,
                                      hasPraktik: currentComp.hasPraktik,
                                      hasTrainee: currentComp.hasTrainee,
                                      hasJobb: currentComp.hasJobb,
                                      isSaved: currentComp.isSaved),
                                ),
                              );
                            }, child:
                                LayoutBuilder(builder: (context, constraints) {
                              if (currentComp.image == "") {
                                return Container(
                                    alignment: Alignment.center,
                                    //  color: Colors.grey.withOpacity(0.2),
                                    child: Text(currentComp.name,
                                        style: const TextStyle(fontSize: 12)));
                              } else {
                                return Container(
                                    decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(currentComp.image),
                                    // fit: BoxFit.cover,
                                  ),
                                ));
                              }
                            }));
                          });
                    } else {
                      return const Text('Loading...');
                    }
                  })))
    ]);
  }
}
