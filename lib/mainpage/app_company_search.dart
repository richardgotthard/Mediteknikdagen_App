import 'package:flutter/material.dart';

import '../style/colors.dart';

import '../models/companies.dart';

//final key = GlobalKey<ScaffoldState>();
//final TextEditingController _searchQuery = TextEditingController();
//List<CompanyModel> _list;
//List<CompanyModel> _searchList = List();

//bool _IsSearching;
//String _searchText = "";

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

final TextEditingController _searchQuery = TextEditingController();

class _SearchState extends State<Search> {
  List<CompanyModel> found_companies = [];
  @override
  initState() {
    // at the beginning, all users are shown
    found_companies = companyItems;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<CompanyModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = companyItems;
    } else {
      // results = companyItems
      //     .where((user) =>
      //         user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
      //     .toList();

      //FIX THIS!!!!! https://stackoverflow.com/questions/60245865/the-operator-isnt-defined-for-the-class-object-dart
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      found_companies = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: const [
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
