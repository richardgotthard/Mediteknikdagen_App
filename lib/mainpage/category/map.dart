import 'package:flutter/material.dart';
import 'package:mtd_app/models/mtdgruppen.dart';
import 'package:mtd_app/style/colors.dart';
import '../../icons/custom_app_icons.dart';

//didnt get included in final version
class MapMassan extends StatelessWidget {
  const MapMassan({Key? key}) : super(key: key);
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
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Us',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: mtdgruppen_list.length,
                      itemBuilder: (BuildContext context, i) {
                        final currentMTD = mtdgruppen_list[i];
                        return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                                top: 2, left: 10, right: 10, bottom: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: mainColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    currentMTD.role,
                                  ),
                                  Container(
                                    width: 200,
                                    margin: const EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentMTD.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          currentMTD.contac_mail,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]));
                      })),
            ],
          ),
        ));
  }
}
