// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:mtd_app/models/mtdgruppen.dart';

import 'package:mtd_app/style/colors.dart';

import 'package:url_launcher/url_launcher_string.dart';

import '../../icons/custom_app_icons.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => ContactUsState();
}

class ContactUsState extends State<ContactUs> {
  // Wheater to loop through elements
  final bool _loop = true;

  // Scroll controller for carousel
  late InfiniteScrollController _controller;

  // Maintain current index of carousel
  int _selectedIndex = 0;

  String _selectedIndexName = "Filip";
  String _selectedIndexPost = "Projektledare";
  String _selectedIndexMail = "Projektledare";

  // Width of each item
  final double _itemExtent = 150;

  // Get screen width of viewport.
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/MTD_bilder/');
  }

  final String aboutTitle = "Medieteknikdagen";
  final String about =
      "Medieteknikdagen är medieteknikstudenternas årliga arbetsmarknadsdag på Linköpings universitet. Vi förenar företag och studenter och skapar kontakter för livet!";

  final String aboutus = "Det är vi som representerar MTD";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                MyFlutterApp.mtd_svart,
                color: mainColor,
                size: 40,
              ),
            ),
          ),
          actions: const [
            SizedBox(width: 40, height: 40),
          ],
          iconTheme: const IconThemeData(color: mainColor),
        ),
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        aboutTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        about,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Lato'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        aboutus,
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Lato'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox(
                          height: 300,
                          child: InfiniteCarousel.builder(
                            center: true,
                            itemCount: mtdgruppen_list.length,
                            itemExtent: _itemExtent,
                            velocityFactor: 0.8,
                            scrollBehavior: kIsWeb
                                ? ScrollConfiguration.of(context).copyWith(
                                    dragDevices: {
                                      // Allows to swipe in web browsers
                                      PointerDeviceKind.touch,
                                      PointerDeviceKind.mouse
                                    },
                                  )
                                : null,
                            loop: _loop,
                            controller: _controller,
                            onIndexChanged: (index) {
                              if (_selectedIndex != index) {
                                setState(() {
                                  // _itemExtent = 240;
                                  _selectedIndex = index;
                                  _selectedIndexName =
                                      mtdgruppen_list[index].name;
                                  _selectedIndexPost =
                                      mtdgruppen_list[index].role;
                                  _selectedIndexMail =
                                      mtdgruppen_list[index].contac_mail;
                                });
                              }
                            },
                            itemBuilder: (context, itemIndex, realIndex) {
                              //final currentComp = mtdgruppen_list[itemIndex];
                              // final midperson = notificationsData[realIndex];
                              final currentOffset = _itemExtent * realIndex;
                              return AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  final diff =
                                      (_controller.offset - currentOffset);
                                  const maxPadding = 10.0;
                                  final carouselRatio2 =
                                      _itemExtent / maxPadding;

                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: (diff / carouselRatio2).abs(),
                                      bottom: (diff / carouselRatio2).abs(),
                                      // left: (diff / carouselRatio).abs(),
                                      // right: (diff / carouselRatio).abs(),
                                    ),
                                    child: child,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.animateToItem(realIndex);

                                      // ResizeImage(

                                      //     notificationsData[itemIndex].image,
                                      //     width: 200,
                                      //     allowUpscaling: true);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: kElevationToShadow[1],
                                        image: DecorationImage(
                                          image: AssetImage(
                                              mtdgruppen_list[itemIndex].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                    Text(_selectedIndexName,
                        style: const TextStyle(fontSize: 25)),
                    Text(_selectedIndexPost,
                        style: const TextStyle(fontSize: 20)),
                    Container(
                        padding: const EdgeInsets.all(20.0),
                        child: const Text("Frågor?",
                            style: TextStyle(fontSize: 15))),
                    LayoutBuilder(builder: (context, constraints) {
                      if (_selectedIndexMail == "") {
                        return const SizedBox.shrink();
                      } else {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: InkWell(
                              child: const Text(
                                "Kontakta oss",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontFamily: 'Lato'),
                              ),
                              onTap: () => _launchURL(_selectedIndexMail)),
                        );
                      }
                    }),
                  ],
                );
              },
              childCount: 1,
            ),
          )
        ]));
  }
}

void _launchURL(String selectedMail) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: selectedMail,
  );
  String url = params.toString();
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    //print('Could not launch $url');
  }
}
