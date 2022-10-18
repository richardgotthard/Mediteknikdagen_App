import 'package:flutter/material.dart';
import 'package:mtd_app/mainpage/category/aboutus.dart';
import 'package:mtd_app/mainpage/category/schedule.dart';
import 'package:mtd_app/mainpage/gridviewer2.dart';
import 'package:mtd_app/style/colors.dart';

import 'mainpage/app_category_list.dart';
import 'mainpage/app_company_search.dart';
import 'mainpage/app_header.dart';
import 'mainpage/app_mount_listview.dart';
import 'mainpage/app_search.dart';
import '../icons/custom_app_icons.dart';
import 'mainpage/category/companies.dart';
import 'mainpage/category/events.dart';
import 'mainpage/category/eventScreen.dart';
import 'mainpage/category/mapmap.dart';
import 'mainpage/gridcompanies.dart';
import 'mainpage/saved_list.dart';
import 'mainpage/settings.dart';
import 'models/category_model.dart';

List<Route> myRoute = [
  MaterialPageRoute(builder: (_) => const Companies()),
  MaterialPageRoute(builder: (_) => const Schedule()),
  MaterialPageRoute(builder: (_) => const MapMap()),
  MaterialPageRoute(builder: (_) => const EventScreen()),
];

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AppHeader(),
        AppSearch(),
        Expanded(
          child: AppMountListView(),
        ),
        AppCategoryList(),
        //AppBottomBar(),
      ],
    ),
    Column(children:  [
      const Search(),
      GridViewer2(),
    ]),
    Column(children: const [
      SavedList(),
    ]),
    Column(children: const [
      Event(),
      //Settings(),
    ]),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const MyStatefulWidget(),
            //     ),
            //   );
            // },
            child: const Icon(
              MyFlutterApp.mtd_svart,
              color: mainColor,
              size: 40,
            ),
          ),
        ),
        actions: const [
          SizedBox(width: 40, height: 40),

          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const Settings(),
          //           ),
          //         );
          //       },
          //       child: const Icon(Icons.settings),
          //     )),
        ],
        iconTheme: const IconThemeData(color: mainColor),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(30),
          color: mainColor,
          child: Stack(
            children: [
              ListView.builder(
                  itemCount: categories.length + 2,
                  itemBuilder: (BuildContext context, i) {
                    if (i == 0) {
                      // Add an extra item to the start
                      return ListTile(
                        title: const Text("Home",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      );
                    }
                    if (i == categories.length + 1) {
                      return ListTile(
                          title: const Text("About us",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          onTap: () {
                            Navigator.of(context).push((MaterialPageRoute(
                                builder: (_) => const AboutUs())));
                          });
                    }

                    i -= 1;
                    return ListTile(
                      title: Text(categories[i].category,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      onTap: () {
                        Navigator.of(context).push((myRoute[i]));
                      },
                    );
                  }),
              const OverflowBox(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  MyFlutterApp.mtd_svart,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: mainColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        // margin: const EdgeInsets.only(top: 20),
        //padding: const EdgeInsets.all(8),
      ),
    );
  }
}
/*
return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Icon(
            MyFlutterApp.mtd_svart,
            color: mainColor,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 40, height: 40),
        ],
        iconTheme: const IconThemeData(color: mainColor),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment.bottomLeft,
          child: const Icon(
            MyFlutterApp.mtd_svart,
            color: Colors.white,
            size: 80,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppHeader(),
          AppSearch(),
          Expanded(
            child: AppMountListView(),
          ),
          AppCategoryList(),
          AppBottomBar(),
        ],
      ),
    );*/