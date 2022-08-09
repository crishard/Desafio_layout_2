import 'package:flutter/material.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 2.2,
                  height: 40,
                  color: Colors.white,
                  margin: const EdgeInsets.only(right: 10),
                ),
                const Text(
                  "Search...",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 33),
                )
              ],
            )),
            Container(
              margin: const EdgeInsets.only(top: 7),
              color: Color.fromARGB(255, 197, 15, 230),
            width: 330,
            height: 2,)
      ],
    );
  }
}
