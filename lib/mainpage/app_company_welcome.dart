import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/models/companies_firebase.dart';

Stream<List<Company>> readCompanyWelcome() => FirebaseFirestore.instance
    .collection("Companies")
    .orderBy("isHuvudsponsor")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList());

class AppWelcomer extends StatelessWidget {
  const AppWelcomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding:
                const EdgeInsets.only(left: 30, top: 5, right: 30, bottom: 10),
            // margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'MTD vill utbringa ett stort tack till våra huvudsponsorer',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Expanded(
                    child: StreamBuilder<List<Company>>(
                        stream: readCompanyWelcome(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                                'Something went wrong!  '); //${snapshot.error}
                          } else if (snapshot.hasData) {
                            var companyss = snapshot.data!;

                            companyss.shuffle();

                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(
                                  left: 30, top: 5, right: 30, bottom: 20),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 60,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount:
                                  companyss.length, //snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final currentComp = companyss[index];

                                return GestureDetector(onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CompanyScreen(
                                        image: currentComp.image,
                                        name: currentComp.name,
                                        description: currentComp.description,
                                        hasExjobb: currentComp.hasExjobb,
                                        hasSommarjobb:
                                            currentComp.hasSommarjobb,
                                        hasPraktik: currentComp.hasPraktik,
                                        hasTrainee: currentComp.hasTrainee,
                                        hasJobb: currentComp.hasJobb,
                                        isSaved: currentComp.isSaved,
                                      ),
                                    ),
                                  );
                                }, child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  if (currentComp.image == "") {
                                    return Container(
                                        alignment: Alignment.center,
                                        // color: Colors.grey.withOpacity(0.2),
                                        child: const Text("hej",
                                            style: TextStyle(fontSize: 12)));
                                  } else {
                                    return Container(
                                        decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            currentComp.image),
                                        //fit: BoxFit.cover,
                                      ),
                                    ));
                                  }
                                }));
                              },
                            );
                          } else {
                            return const Text('Loading...');
                          }
                        }))
              ],
            )));
  }
}
