import 'package:flutter/material.dart';
import 'package:mtd_app/style/colors.dart';
import '../icons/custom_app_icons.dart';

class NotificationScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String link;
  final String linktitle;

  const NotificationScreen(
      {Key? key,
      this.image = "",
      required this.title,
      required this.description,
      this.link = "",
      this.linktitle = ''})
      : super(key: key);

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
        constraints: const BoxConstraints(maxHeight: 600),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(image),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 15, fontFamily: 'Lato'),
                  ),
                  // Testpurpose for linking

                  // Container(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: InkWell(
                  //       child: Text(
                  //         linktitle,
                  //         style: const TextStyle(
                  //             fontSize: 15,
                  //             color: Colors.blue,
                  //             fontFamily: 'Lato'),
                  //       ),
                  //       onTap: () => _launchInstagram(
                  //           "instagram://user?username=medieteknikdagen.exe",
                  //           "https://www.instagram.com/medieteknikdagen/")),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Test for linking data
// void _launchInstagram(String link_native, String link_web) async {
//   // var nativeUrl = "instagram://user?username=medieteknikdagen.exe";
// //var webUrl = "https://www.instagram.com/medieteknikdagen/?hl=sv";

//   try {
//     await launchUrlString(link_native, mode: LaunchMode.externalApplication);
//   } catch (e) {
//     print(e);
//     await launchUrlString(link_web, mode: LaunchMode.platformDefault);
//   }
// }
