import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import '../models/companies.dart';
import 'firebase_options.dart';

//DatabaseReference companyref = FirebaseDatabase.instance.ref('companies');

class Company {
  String id;
  final String name;
  final String description;
  final String location;
  final bool hasExjobb;
  final bool hasJobb;
  final bool hasSommarjobb;

  Company({
    this.id = '',
    required this.name,
    required this.description,
    required this.location,
    required this.hasExjobb,
    required this.hasJobb,
    required this.hasSommarjobb,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'location': location,
        'hasExjobb': hasExjobb,
        'hasJobb': hasJobb,
        'hasSommarjobb': hasSommarjobb,
      };

  static Company fromJson(Map<String, dynamic> json) => Company(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        location: json['location'],
        hasExjobb: json['hasExjobb'],
        hasJobb: json['hasJobb'],
        hasSommarjobb: json['hasSommarjobb'],
      );
}

Stream<List<Company>> readCompany() => FirebaseFirestore.instance
    .collection('companies')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList());

Widget buildCompany(Company company) => ListTile(
      // alignment: Alignment.center,
      // color: Colors.grey.withOpacity(0.2),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(currentComp.path),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      title: Text(company.name),
    );

class GridViewer2 extends StatelessWidget {
  GridViewer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder<List<Company>>(
            stream: readCompany(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong! ${snapshot.error} ');
              } else if (snapshot.hasData) {
                final companyss = snapshot.data!;

                return ListView(
                  children: companyss.map(buildCompany).toList(),
                );
                // padding: const EdgeInsets.all(20.0),
                // //itemCount: data.size,
                // gridDelegate:
                //     const SliverGridDelegateWithMaxCrossAxisExtent(
                //         maxCrossAxisExtent: 200,
                //         childAspectRatio: 3 / 2,
                //         crossAxisSpacing: 20,
                //         mainAxisSpacing: 20),
                // itemBuilder: (context, index) {
                // return const Text('hej');
                // print(data.size);

                //final currentComp = data.docs[index];
                //return GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CompanyScreen(
                //          // image: currentComp.path,
                //           name: currentComp.name,
                //           description: companyItems[index].description,
                //           location: companyItems[index].location,
                //           hasExjobb: companyItems[index].hasExjobb,
                //           hasSommarjobb: companyItems[index].hasSommarjobb,
                //           hasJobb: companyItems[index].hasJobb),
                //     ),
                //   );
                // },

                // Container(
                //   alignment: Alignment.center,
                //   color: Colors.grey.withOpacity(0.2),
                //   // decoration: BoxDecoration(
                //   //   image: DecorationImage(
                //   //     image: NetworkImage(currentComp.path),
                //   //     fit: BoxFit.cover,
                //   //   ),
                //   // ),
                //   child: Text(' ${data.docs[index]['name']}'),
                // );
                //);
              } else {
                return const Text('Loading...');
              }
            }));
  }
}

// Future<bool> checkIfDocExists(String docId) async {
//   try {
//     // Get reference to Firestore collection
//     var collectionRef = FirebaseFirestore.instance.collection('companies');

//     var doc = await collectionRef.doc(docId).get();
//     return doc.exists;
//   } catch (e) {
//     throw e;
//   }
// }

// class Choice {
//   const Choice({this.title = '', this.icon = Icons.access_time});
//   final String title;
//   final IconData icon;
// }

//  List<String> choices = <Choice>[
//   const Choice(title: 'Home', icon: Icons.home),
//   const Choice(title: 'Contact', icon: Icons.contacts),
//   const Choice(title: 'Map', icon: Icons.map),
//   const Choice(title: 'Phone', icon: Icons.phone),
//   const Choice(title: 'Camera', icon: Icons.camera_alt),
//   const Choice(title: 'Setting', icon: Icons.settings),
//   const Choice(title: 'Album', icon: Icons.photo_album),
//   const Choice(title: 'WiFi', icon: Icons.wifi),
// ];

// class SelectCard extends StatelessWidget {
//   const SelectCard({Key? key, required this.choice}) : super(key: key);
//   final Choice choice;

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.;
//     return Card(
//         color: Colors.orange,
//         child: Center(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                     child:
//                         Icon(choice.icon, size: 50.0, color: textStyle.color)),
//                 Text(choice.title, style: textStyle),
//               ]),
//         ));
//   }
// }

//   //   return StreamBuilder(
//   //       stream: FirebaseDatabase.instance
//   //           .ref()
//   //           .child('messages')
//   //           .child('company')
//   //           .orderByChild('company')
//   //           .equalTo(1)
//   //           .onValue,
//   //       builder: (BuildContext context, AsyncSnapshot snapshot) {
//   //         if (snapshot.hasData) {
//   //           if (snapshot.data.snapshot.value != null) {
//   //             Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
//   //             List<dynamic> list = map.values.toList()
//   //               ..sort((a, b) => b['timestamp'].compareTo(a['timestamp']));

//   //             return GridView.builder(
//   //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//   //                     crossAxisCount: 3),
//   //                 itemCount: list.length,
//   //                 padding: EdgeInsets.all(2.0),
//   //                 // ignore: dead_code
//   //                 itemBuilder: (context, index) {
//   //                   return Padding(
//   //                       padding: const EdgeInsets.all(5),
//   //                       child: Container(
//   //                           decoration: new BoxDecoration(
//   //                               image: new DecorationImage(
//   //                                   image:
//   //                                       new NetworkImage(snapshot.data[index]),
//   //                                   fit: BoxFit.cover))));
//   //                 });
//   //           } else {
//   //             return const Center(
//   //                 child: Text(
//   //               'Es wurden noch keine Fotos im Chat gepostet.',
//   //               style: TextStyle(fontSize: 20.0, color: Colors.grey),
//   //               textAlign: TextAlign.center,
//   //             ));
//   //           }
//   //         } else {
//   //           return const CircularProgressIndicator();
//   //         }
//   //       });
//   // }

// //         child: FutureBuilder(
// //       future: FirebaseDatabase.instance
// //           .ref()
// //           .child("companies")
// //           .orderByKey()
// //           .once(),
// //       builder: (BuildContext context, AsyncSnapshot snapshot) {
// //         if (snapshot.connectionState == ConnectionState.done) {
// //           return GridView.builder(
// //               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
// //                   maxCrossAxisExtent: 200),
// //               itemBuilder: (BuildContext context, index) {
// //                 // ignore: avoid_unnecessary_containers
// //                 return Container(child: Text(snapshot.data.toString()));
// //               });
// //         } else {
// //           return CircularProgressIndicator();
// //         }
// //       },
// //     ));
// //   }
// // }

// // return FutureBuilder(
// //     future: companyref.once(),
// //     builder: (context, snapshot){
// //       if(snapshot.hasData){
// //         GridView.builder(
// //         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
// //             maxCrossAxisExtent: 200,
// //             childAspectRatio: 3 / 2,
// //             crossAxisSpacing: 20,
// //             mainAxisSpacing: 20),

// //         itemBuilder: (BuildContext ctx, index) {
// //           return Container(
// //             alignment: Alignment.center,
// //             decoration: BoxDecoration(
// //                 color: Colors.amber,
// //                 borderRadius: BorderRadius.circular(15)),
// //             child: Text(companyref[index]["company"]),
// //           );
// //         })

// //       }
// //     }
// //     );

// // @protected
// // Widget customBuild(BuildContext context) {
// //   debugPrint("CustomState(${T.toString()}).customBuild executed");
// //   return null;
// // }

// // // The following procedure is used for widget startup loading, remember to use await when calling any async call.
// // @protected
// // Future<bool> loadWidget(BuildContext context, bool isInit) async {
// //   debugPrint("CustomState(${T.toString()}).loadWidget executed " +
// //       (isInit ? "for the first time" : "again"));
// //   return true;
// // }
