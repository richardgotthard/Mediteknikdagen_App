import 'package:flutter/material.dart';

//import 'package:firebase_database/firebase_database.dart';
//import 'package:mtd2022/models/company.dart';
//import 'package:mtd2022/widgets/company_card.dart';
//import 'package:sizer/sizer.dart';

class CompaniesScreen extends StatelessWidget {
  CompaniesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Företag på mässan",
        ),
        centerTitle: true,
        foregroundColor: Colors.black87,
        backgroundColor: Color(0xfafafaFF),
        elevation: 0,
      ),
       body: const Center(
          child: Text('Hello World'),
    ),
  );
  }
}
