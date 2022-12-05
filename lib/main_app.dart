import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtd_app/mainpage/app_company_welcome.dart';
import 'package:mtd_app/mainpage/app_notificationlist.dart';

import 'package:mtd_app/notification.dart';

import 'package:mtd_app/mainpage/gridviewer.dart';
import 'package:mtd_app/style/colors.dart';

import 'mainpage/app_search.dart';
import '../icons/custom_app_icons.dart';

import 'mainpage/category/events.dart';
import 'mainpage/category/contactus.dart';

// List<Route> myRoute = [
//   MaterialPageRoute(builder: (_) => const Companies()),
//   MaterialPageRoute(builder: (_) => const Schedule()),
//   MaterialPageRoute(builder: (_) => const MapMap()),
// ];

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  //DateTime dateFormat = new DateTime("YYYY-MM-dd HH:mm:ss")

  final List<Widget> _widgetOptions = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        //AppHeader(),
        AppWelcomer(),
        AppSearch(),
        AppMountListView(),

        //AppCategoryList(),
        //AppBottomBar(),
      ],
    ),
    Column(children: const [
      // Search(),
      GridViewer(),
    ]),
    //***  SAVED COMPANIES, REQUIRES USER ***/
    // Column(children: const [
    //   SavedList(),
    // ]),
    Column(children: const [
      Event(),
      //Settings(),
    ]),
  ];

  @override
  void initState() {
    final firebaseMessaging = FCM();

    firebaseMessaging.setPermission();
    firebaseMessaging.setNotifications();
    firebaseMessaging.fcmSubscribe("123");

    //DateTime currentDate =
    //DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    //print(currentDate.toString().replaceAll("00:00:00.000", ""));

    // firebaseMessaging.addToNotification(
    //     "Violet",
    //     "Ett test event",
    //     "Test_text",
    //     "klicka här",
    //     "https://thumbs.dreamstime.com/b/example-red-tag-example-red-square-price-tag-117502755.jpg",
    //     "https://www.google.com/?&hl=sv",
    //     "https://www.google.com/?&hl=sv");

    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
          child: AppBar(
            centerTitle: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.white,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const InkWell(
              child: Icon(
                MyFlutterApp.mtd_svart,
                color: mainColor,
                size: 40,
              ),
            ),
            actions: [
              const SizedBox(width: 40, height: 40),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.help_outline_outlined,
                    color: mainColor,
                  ),
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      Navigator.of(context).push((MaterialPageRoute(
                          builder: (_) => const ContactUs())));
                    });
                  },
                ),
              )
            ],
            iconTheme: const IconThemeData(color: mainColor),
          ),
        ),
        // Drawer: in progress but not used
        // drawer: Drawer(
        //   child: Container(
        //     padding: const EdgeInsets.all(30),
        //     color: mainColor,
        //     child: Stack(
        //       children: [
        //         ListView.builder(
        //             itemCount: categories.length + 2,
        //             itemBuilder: (BuildContext context, i) {
        //               if (i == 0) {
        //                 // Add an extra item to the start
        //                 return ListTile(
        //                   title: const Text("Home",
        //                       style: TextStyle(
        //                           color: Color.fromARGB(255, 255, 255, 255))),
        //                   onTap: () {
        //                     Future.delayed(Duration.zero, () {
        //                       Navigator.pop(context);
        //                     });
        //                   },
        //                 );
        //               }
        //               if (i == categories.length + 1) {
        //                 return ListTile(
        //                     title: const Text("About us",
        //                         style: TextStyle(
        //                             color: Color.fromARGB(255, 255, 255, 255))),
        //                     onTap: () {
        //                       Future.delayed(Duration.zero, () {
        //                         Navigator.of(context).push((MaterialPageRoute(
        //                             builder: (_) => const AboutUs())));
        //                       });
        //                     });
        //               }

        //               i -= 1;
        //               return ListTile(
        //                 title: Text(categories[i].category,
        //                     style: const TextStyle(
        //                         color: Color.fromARGB(255, 255, 255, 255))),
        //                 onTap: () {
        //                   Future.delayed(Duration.zero, () {
        //                     Navigator.of(context).push((myRoute[i]));
        //                   });
        //                 },
        //               );
        //             }),
        //         const OverflowBox(
        //           alignment: Alignment.bottomLeft,
        //           child: Icon(
        //             MyFlutterApp.mtd_svart,
        //             color: Colors.white,
        //             size: 80,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          child: CupertinoTabBar(
            //backgroundColor: mainColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.favorite,
              //     color: Colors.white,
              //   ),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.event,
                ),
              ),
            ],
            currentIndex: _selectedIndex,
            activeColor: Colors.white,
            inactiveColor: Colors.white70,
            backgroundColor: mainColor,
            onTap: _onItemTapped,
          ),
        ));
  }
}
