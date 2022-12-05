import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../icons/custom_app_icons.dart';

// ignore: must_be_immutable
class EventScreen extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final String description;
  String descLong;
  String image;
  String url;
  String urlNative;
  String linkText;

  EventScreen({
    Key? key,
    required this.title,
    this.description = '',
    this.descLong = '',
    this.time = '',
    this.date = "",
    this.image = '',
    this.url = '',
    this.urlNative = "",
    this.linkText = "",
  }) : super(key: key);

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
        ),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (date == "") {
              return Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  child: Text(
                    time,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              );
            } else {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                      child: Text(
                        date,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                      child: Text(
                        time,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ]);
            }
          }),
          LayoutBuilder(builder: (context, constraints) {
            if (image == "") {
              return const SizedBox.shrink();
            } else {
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.topCenter,
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Image(
                    image: CachedNetworkImageProvider(image),
                  ),
                ),
              );
            }
          }),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  descLong,
                  style: const TextStyle(fontSize: 18, fontFamily: 'Lato'),
                ),
              ),
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (linkText == "") {
              return const SizedBox.shrink();
            } else {
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                    child: Text(
                      linkText,
                      style: const TextStyle(
                          fontSize: 20, color: Colors.blue, fontFamily: 'Lato'),
                    ),
                    onTap: () => _launchUrl(url, urlNative)),
              );
            }
          }
              // Testpurpose for linking
              ),
        ]),
      ),
    );
  }
}

//Test for linking data
void _launchUrl(String webUrl, String nativeUrl) async {
  //var nativeUrl = "instagram://user?username=medieteknikdagen";
  //var webUrl = "https://www.instagram.com/medieteknikdagen/";

  if (await canLaunchUrlString(nativeUrl)) {
    await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
    //print("native");
  } else if (await canLaunchUrlString(webUrl)) {
    await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
    //print("url");
  } else {
    //print("can't open Instagram");
  }

  // try {
  //   launchUrlString("https://www.instagram.com/medieteknikdagen/",
  //       mode: LaunchMode.externalApplication);
  //   print("google check");

  //   //await launchUrlString(linkNative, mode: LaunchMode.externalApplication);
  // } catch (e) {
  //   print(e);
  //   await launchUrlString(linkWeb, mode: LaunchMode.platformDefault);
  // }
}
