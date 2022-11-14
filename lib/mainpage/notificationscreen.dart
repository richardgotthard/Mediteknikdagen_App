import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../icons/custom_app_icons.dart';

class NotificationScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String link;
  final String linktitle;
  final String url;
  final String urlNative;

  const NotificationScreen(
      {Key? key,
      this.image = "",
      required this.title,
      required this.description,
      this.link = "",
      this.linktitle = '',
      this.url = '',
      this.urlNative = ''})
      : super(key: key);

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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: AspectRatio(
                aspectRatio: 1.5,
                child: SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: CachedNetworkImageProvider(image),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 15, fontFamily: 'Lato'),
                  ),
                ),
              ),
            ),
            // Testpurpose for linking

            LayoutBuilder(builder: (context, constraints) {
              if (linktitle == "") {
                return const SizedBox.shrink();
              } else {
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                      child: Text(
                        linktitle,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontFamily: 'Lato'),
                      ),
                      onTap: () => _launchUrl(url, urlNative)),
                );
              }
            })
          ],
        ),
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
