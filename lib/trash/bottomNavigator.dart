// import 'package:doris/constants.dart';
// import 'package:doris/doris_icons.dart';
// import 'package:doris/pages/homePage.dart';
// import 'package:doris/pages/leaderboardPage.dart';
// import 'package:doris/pages/pomodoroSuccessful.dart';
// import 'package:doris/pages/settings.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeState();
//   }
// }

// class _HomeState extends State<Home> with WidgetsBindingObserver {
//   late bool checkValue1;
//   int selectedIndex = 0;
//   final List<GlobalKey<NavigatorState>> keys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];
//   @override
//     removeValues();
//     auth.signOut();

//     super.initState();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     print(state);
//     switch (state) {
//       case AppLifecycleState.inactive:
//         print('appLifeCycleState inactive');
//         break;
//       case AppLifecycleState.resumed:
//         print('appLifeCycleState resumed');
//         break;
//       case AppLifecycleState.paused:
//         print('appLifeCycleState paused');
//         break;
//       case AppLifecycleState.detached:
//         print('appLifeCycleState detached');
//         break;
//     }
//   }

//   void _changeTab(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final isFirstRouteInCurrentTab =
//             !await keys[selectedIndex].currentState!.maybePop();
//         let system handle back button if we're on the first route
//         return isFirstRouteInCurrentTab;
//       },
//       child: Container(
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               colors: [
//                 Color(0xFFE0F3F1),
//                 Color(0xFFC0EBE3),
//                 Color(0xFF65C5B2),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               stops: [
//                 0.0,
//                 0.5,
//                 1,
//               ],
//               tileMode: TileMode.clamp),
//         ),
//         child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.transparent,
//             actions: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: IconButton(
//                   icon: Icon(
//                     Doris.info,
//                     color: secondaryColor,
//                     size: 28,
//                   ),
//                   onPressed: () {
//                     _showModalBottomSheet();
//                   },
//                 ),
//               )
//             ],
//             title: const Text(
//               "DORIS",
//               style: TextStyle(
//                 fontSize: 15,
//                 letterSpacing: 1.25,
//                 fontWeight: FontWeight.bold,
//                 color: secondaryColor,
//               ),
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             selectedItemColor: secondaryTextColor,
//             backgroundColor: Colors.white,
//             currentIndex: selectedIndex,
//             iconSize: 30,
//             type: BottomNavigationBarType.fixed,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.leaderboard_outlined,
//                 ),
//                 activeIcon: Icon(
//                   Icons.leaderboard,
//                 ),
//                 label: "",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Doris.fisk,
//                 ),
//                 activeIcon: Icon(Doris.fisk_full),
//                 label: "",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Doris.insta_llningar),
//                 activeIcon: Icon(Doris.insta_llningar_full),
//                 label: "",
//               ),
//             ],
//             onTap: (int index) {
//               if (selectedIndex == index) {
//                 switch (index) {
//                   case 0:
//                     keys[0].currentState!.popUntil((r) => r.isFirst);

//                     break;
//                   case 1:
//                     keys[1].currentState!.popUntil((r) => r.isFirst);
//                     break;
//                   case 2:
//                     keys[2].currentState!.popUntil((r) => r.isFirst);
//                     break;
//                   case 3:
//                     keys[3].currentState!.popUntil((r) => r.isFirst);
//                     break;
//                 }
//               } else {
//                 _changeTab(index);
//               }
//             },
//           ),
//           body: SafeArea(
//             child: Stack(
//               children: [
//                 _buildOffstageNavigator(0),
//                 _buildOffstageNavigator(1),
//                 _buildOffstageNavigator(2),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
//     return {
//       '/': (context) {
//         return [
//           const LeaderboardPage(),
//           const MyHomePage(),
//           const SettingsPage()
//         ].elementAt(index);
//       },
//     };
//   }

//   Widget _buildOffstageNavigator(int index) {
//     var routeBuilders = _routeBuilders(context, index);
//     return Offstage(
//       offstage: selectedIndex != index,
//       child: Navigator(
//         key: keys[index],
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//             builder: (context) => routeBuilders[routeSettings.name]!(context),
//           );
//         },
//       ),
//     );
//   }

//   Future<void> _showModalBottomSheet() async {
//     return showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//         builder: (context) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.9,
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(30.0, 15, 30, 15),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Pomodoro-lexikon 📖",
//                         style: TextStyle(
//                             color: secondaryColor,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(Icons.clear),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Container(
//                       margin: EdgeInsets.only(top: 8),
//                       child: ListView(
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: const [
//                               Text(
//                                 "Fokustid",
//                                 style: TextStyle(fontWeight: FontWeight.w600),
//                               ),
//                               Text("Välj hur långa fokusperioder du vill ha."),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Längd på pauser",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                     "Välj hur långa pauser du vill ha mellan fokustiderna."),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Antal fokusperioder",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                     "Välj hur många fokustider du vill köra, Doris rekommenderar att börja med tre!"),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Overtime",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                     "Klockan fortsätter även efter att den angivna tiden runnit ut, tills du själv stänger av det. Perfekt om du är i ett flow! 🕺"),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Fokusera med vänner",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                     "Skapa ett rum och ta hand om era fiskar tillsammans. Om en av er avbryter dör allas fiskar 💀"),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Tillgång till andra appar",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                     "Sätt en tidsperiod där du kan lämna Doris, men var försiktig! Om du inte är tillbaka innan tiden runnit ut dör din fisk 😠"),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Tillåt notiser",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                     "Notiser kan plinga under fokustiden. Do you have what it takes för att hålla fokus ändå?"),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(top: 30.0, bottom: 40),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Text(
//                                   "Fokusera med ljud",
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                     "Lyssna på lite tunes från valar eller lite regn som smattrar. Koppla även till ditt Spotify-konto om du har Premium!"),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
