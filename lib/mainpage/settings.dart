import 'package:flutter/material.dart';
import 'package:mtd_app/icons/custom_app_icons.dart';
import '../style/colors.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Settings',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              Text(
                'Coming soon...',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              // Text(
              //   '[USEFUL SETTINGS ALTERNATIVES]',
              //   style: TextStyle(
              //     fontWeight: FontWeight.normal,
              //     fontSize: 12,
              //   ),
              // ),
              // ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: categories.length,
              //     itemBuilder: (BuildContext context, i) {
              //       return Container(
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black, width: 2),
              //             // color: Colors.grey.withOpacity(0.1),
              //           ),
              //           child: const ListTile(
              //             title: Text(
              //               "Example text for settings",
              //             ),
              //           ));
              //     }),
            ],
          ),
        ));
  }
}
