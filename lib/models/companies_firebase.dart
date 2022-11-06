import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  String id;
  String name;
  String description;

  final bool hasExjobb;
  final bool hasJobb;
  final bool hasSommarjobb;
  final bool hasPraktik;
  final bool hasTrainee;
  bool isSaved;
  String image;

  Company({
    this.id = '',
    required this.name,
    this.description = "",
    required this.hasExjobb,
    required this.hasJobb,
    required this.hasSommarjobb,
    this.hasPraktik = false,
    this.hasTrainee = false,
    this.isSaved = false,
    this.image = "",
  });

  Map<String, dynamic> toJson() => {
        //   'id': id,
        'name': name,
        'description': description,
        //  'location': location,
        'hasExjobb': hasExjobb,
        'hasJobb': hasJobb,
        'hasSommarjobb': hasSommarjobb,
        'hasPraktik': hasPraktik,
        'hasTrainee': hasTrainee,
        'isSaved': isSaved,
        'image': image,
      };

  static Company fromJson(Map<String, dynamic> json) => Company(
        //  id: json['id'],
        name: json['name'],
        description: json['description'],
        // location: json['location'],
        hasExjobb: json['hasExjobb'],
        hasJobb: json['hasJobb'],
        hasSommarjobb: json['hasSommarjobb'],
        hasPraktik: json['hasPraktik'],
        hasTrainee: json['hasTrainee'],
        isSaved: json['saved'],
        image: json['image'],
      );
}

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

Stream<List<Company>> readCompanyABC() => FirebaseFirestore.instance
    .collection("Companies")
    .orderBy("name")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList());
