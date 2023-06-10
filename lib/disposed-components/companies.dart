import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/companyscreen.dart';
import 'package:mtd_app/models/companies_firebase.dart';
import 'package:mtd_app/style/colors.dart';
import '../icons/custom_app_icons.dart';

class Companies extends StatelessWidget {
  const Companies({Key? key}) : super(key: key);
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
        body: StreamBuilder<List<Company>>(
            // initialData: readCompany(),
            stream: readCompanyABC(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                    'Something went wrong!  '); //${snapshot.error}
              } else if (snapshot.hasData) {
                var companyss = snapshot.data!;

                return ListView.builder(
                    padding: const EdgeInsets.all(20.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final currentComp = companyss[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompanyScreen(
                                  image: currentComp.image,
                                  name: currentComp.name,
                                  description: currentComp.description,
                                  hasExjobb: currentComp.hasExjobb,
                                  hasSommarjobb: currentComp.hasSommarjobb,
                                  hasJobb: currentComp.hasJobb,
                                  hasTrainee: currentComp.hasTrainee,
                                  hasPraktik: currentComp.hasPraktik,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(30.0),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: mainColor, width: 2),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            alignment: Alignment.center,
                            child: Text(currentComp.name),
                          ));
                    });
              } else {
                return const Text('Loading...');
              }
            }));
  }
}
