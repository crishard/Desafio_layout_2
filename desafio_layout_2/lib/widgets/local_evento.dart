import 'package:flutter/material.dart';

class LocalEvento extends StatelessWidget {
  const LocalEvento({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/images/map.jpg',
        height: MediaQuery.of(context).size.height / 2,
        fit: BoxFit.cover,
      ),
    );
  }
}
