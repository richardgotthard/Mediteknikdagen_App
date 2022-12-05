import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';
import '../icons/custom_app_icons.dart';

// ignore: must_be_immutable
class CompanyScreen extends StatelessWidget {
  final String image;

  final String name;
  final String description;
  // final String location;
  final bool hasExjobb;
  final bool hasSommarjobb;
  final bool hasJobb;
  final bool hasPraktik;
  final bool hasTrainee;

  const CompanyScreen({
    Key? key,
    required this.name,
    required this.description,
    //  required this.location,
    required this.hasExjobb,
    required this.hasSommarjobb,
    required this.hasJobb,
    required this.hasPraktik,
    required this.hasTrainee,
    required this.image,
  }) : super(key: key);

  // Future addToFavorites() async {
  //   CollectionReference _collectionRef =
  //       FirebaseFirestore.instance.collection("Favorites");

  //   return _collectionRef.doc().collection("Companies").doc().set({
  //     "name": name,
  //     "description": description,
  //     "hasExjobb": hasExjobb,
  //     "hasSommarjobb": hasSommarjobb,
  //     "hasJobb": hasJobb,
  //     "image": image,
  //     "isSaved": isSaved,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
        title: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              MyFlutterApp.mtd_svart,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        actions: const [
          SizedBox(width: 40, height: 40),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        constraints: const BoxConstraints(minHeight: 400, maxHeight: 600),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          // color: Colors.grey.withOpacity(0.1),
        ),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                name,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (hasExjobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Exjobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasSommarjobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Sommarjobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasJobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Jobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasPraktik == true) ...[
                        Container(
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Praktik',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasTrainee == true) ...[
                        Container(
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Trainee',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: LayoutBuilder(builder: (context, constraints) {
                if (description == "") {
                  return const SizedBox.shrink();
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        description,
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Lato'),
                      ),
                    ),
                  );
                }
              }),
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (image == "") {
                return const SizedBox.shrink();
              } else {
                return Container(
                  margin: const EdgeInsets.all(20.0),
                  alignment: Alignment.topCenter,
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Image(
                      image: CachedNetworkImageProvider(image),
                    ),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
