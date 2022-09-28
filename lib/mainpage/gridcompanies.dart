import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

DatabaseReference companyref = FirebaseDatabase.instance.ref('companies');

class GridViewer extends StatelessWidget {
  const GridViewer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
      stream:
          FirebaseDatabase.instance.ref().child("companies").once().asStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200),
              itemBuilder: (BuildContext context, index) {
                // ignore: avoid_unnecessary_containers
                return Container(child: Text(snapshot.data.toString()));
              });
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}

// return FutureBuilder(
//     future: companyref.once(),
//     builder: (context, snapshot){
//       if(snapshot.hasData){
//         GridView.builder(
//         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200,
//             childAspectRatio: 3 / 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20),

//         itemBuilder: (BuildContext ctx, index) {
//           return Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.circular(15)),
//             child: Text(companyref[index]["company"]),
//           );
//         })

//       }
//     }
//     );

