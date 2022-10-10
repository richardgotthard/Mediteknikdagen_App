// import 'package:flutter/material.dart';

// import '../style/colors.dart';

// import '../models/companies.dart';

// //final key = GlobalKey<ScaffoldState>();
// //final TextEditingController _searchQuery = TextEditingController();
// //List<CompanyModel> _list;
// //List<CompanyModel> _searchList = List();

// //bool _IsSearching;
// //String _searchText = "";

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   final key = GlobalKey<ScaffoldState>();
//   final TextEditingController _searchQuery = TextEditingController();
//   List<CompanyModel> _list;
//   List<CompanyModel> _searchList = List();

//   bool _IsSearching;
//   String _searchText = "";

//   @override
//   void initState() {
//     super.initState();
//     _IsSearching = false;
//     init();
//   }

//   void init() {
//     _list = List();
//     _list.add(
//       CompanyModel(id: "1", name: "name 1", title: "a title 1"),
//     );
//     _list.add(
//       CompanyModel(id: "2", name: "name 2", title: "a title 2"),
//     );
//     _list.add(
//       CompanyModel(id: "3", name: "name 3", title: "b title 3"),
//     );
//     _list.add(
//       CompanyModel(id: "4", name: "name 4", title: "b title 4"),
//     );
//     _list.add(
//       CompanyModel(id: "5", name: "name 5", title: "b title 5"),
//     );
//     _searchList = _list;

//     _searchQuery.addListener(() {
//       if (_searchQuery.text.isEmpty) {
//         setState(() {
//           _IsSearching = false;
//           _searchText = "";
//           _buildSearchList();
//         });
//       } else {
//         setState(() {
//           _IsSearching = true;
//           _searchText = _searchQuery.text;
//           _buildSearchList();
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Discover',
//             style: TextStyle(
//               fontWeight: FontWeight.w900,
//               fontSize: 24,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(children: const [
//                     TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Search',
//                       ),
//                     ),
//                   ]),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10),
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: mainColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Icon(
//                   Icons.tune,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// List<CompanyModel> _buildSearchList() {
//   if (_searchText.isEmpty) {
//     return _searchList = _list;
//   } else {
//     _searchList = _list
//         .where((element) =>
//             element.name.toLowerCase().contains(_searchText.toLowerCase()) ||
//             element.title.toLowerCase().contains(_searchText.toLowerCase()))
//         .toList();
//     print('${_searchList.length}');
//     return _searchList;
//   }
// }
