import 'package:flutter/material.dart';
import 'package:mtd_app/icons/custom_app_icons.dart';
import '../models/category_model.dart';
import 'companyItems.dart';
import '../style/colors.dart';
import '../trash/companyscreen_test.dart';


class SeemoreList extends StatelessWidget {
  const SeemoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: const Center(
          child: Icon(
            MyFlutterApp.mtd_svart,
            color: Colors.white,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 40, height: 40),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final currentCategory = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompanyScreenTest(
                              image: companyItems[index].path,
                              name: companyItems[index].name,
                              description: companyItems[index].description,
                              location: companyItems[index].location,
                              hasExjobb: companyItems[index].hasExjobb,
                              hasSommarjobb: companyItems[index].hasSommarjobb,
                              hasJobb: companyItems[index].hasJobb),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.2), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            currentCategory.icon,
                            color: mainColor,
                          ),
                          Text(
                            currentCategory.category,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
