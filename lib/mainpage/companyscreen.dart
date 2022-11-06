import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';
import '../icons/custom_app_icons.dart';

// ignore: must_be_immutable
class CompanyScreen extends StatelessWidget {
  final String image;
  final String id;
  final String name;
  final String description;
  // final String location;
  final bool hasExjobb;
  final bool hasSommarjobb;
  final bool hasJobb;
  final bool hasPraktik;
  final bool hasTrainee;
  bool isSaved;

  CompanyScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    //  required this.location,
    required this.hasExjobb,
    required this.hasSommarjobb,
    required this.hasJobb,
    required this.hasPraktik,
    required this.hasTrainee,
    this.isSaved = false,
    required this.image,
  }) : super(key: key);

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    //final bool success = sendRequest() as bool;

    isSaved = isLiked;

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    return !isLiked;
  }

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
        decoration: BoxDecoration(
          border: Border.all(color: mainColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        alignment: Alignment.topCenter,
        //padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (hasExjobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Exjobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasSommarjobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Sommarjobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasJobb == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Jobb',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasPraktik == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(color: mainColor),
                          child: const Text('Praktik',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      if (hasTrainee == true) ...[
                        Container(
                          margin: const EdgeInsets.all(5.0),
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
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (image == "") {
                return Container(
                    alignment: Alignment.center,
                    //  color: Colors.grey.withOpacity(0.2),
                    child: Text(name, style: const TextStyle(fontSize: 12)));
              } else {
                return Container(
                  margin: const EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Image(
                        image: NetworkImage(image),
                      ),
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
