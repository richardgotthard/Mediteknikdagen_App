import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';
import '../../icons/custom_app_icons.dart';

class MapMap extends StatelessWidget {
  const MapMap({Key? key}) : super(key: key);
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
            children: const [
              Text(
                'Map',
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
            ],
          ),
        ));
  }
}
