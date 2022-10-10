import 'package:flutter/material.dart';

import '../style/colors.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Recent Updates',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          // SizedBox(height: 20),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         // height: 50,
          //         padding: const EdgeInsets.all(5),
          //         decoration: BoxDecoration(
          //           color: Colors.grey[200],
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         child: Column(children: const [
          //           TextField(
          //             enableSuggestions: true,
          //             decoration: InputDecoration(
          //               border: InputBorder.none,
          //               hintText: 'Search',
          //             ),
          //           ),
          //         ]),
          //       ),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.only(left: 10),
          //       width: 50,
          //       height: 50,
          //       decoration: BoxDecoration(
          //         color: mainColor,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: const Icon(
          //         Icons.tune,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}


/*child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),*/