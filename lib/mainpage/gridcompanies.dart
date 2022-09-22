import 'package:flutter/material.dart';
import '/models/companies.dart';

class GridViewer extends StatelessWidget {
  const GridViewer({Key? key}) : super(key: key);

  //final companies = companiesFromJson();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Companies>(
        future: DataFromCompanies.getDataLocally(context),
        builder: (context, snapshot) {
          final data = snapshot.data;
          final List<String> list = getCompany(data);

          return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
              scrollDirection: Axis.vertical,
              childAspectRatio: 1,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(list.length, (index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.blue[200],
                    child: Center(
                        child: Text(list[index],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ))));
              }));
        });
  }
}

/*

 crossAxisCount: 2,
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 8.0),
                    scrollDirection: Axis.vertical,
                    childAspectRatio: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(list.length, (index) {
                      return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.blue[200],
                          child: Center(
                              child: Text(list[index],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ))));
                    }));
      return GridView.count(
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }*/

class DataFromCompanies {
  static Future<Companies> getDataLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('data/veri.json');
    final reportData = companiesFromJson(data);
    return reportData;
  }
}

//getting list of konular from ReportData
List<String> getCompany(Companies? data) {
  List<String> listkonular = [];
  //konular is not present in all dersler
  // so fist get the length of dersler
  int length = data?.companies.length ?? 0;
  for (var i = 0; i < length; i++) {
    final ders = data?.companies.elementAt(i);
    //now get the number of konular
    listkonular.add(ders?.company ?? '');
    // print(konu?.konuBasligi);
  }
  return listkonular;
}
