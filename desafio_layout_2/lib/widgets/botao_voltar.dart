import 'package:flutter/material.dart';

class BoTaoVoltar extends StatelessWidget {
  const BoTaoVoltar(
      {Key? key, required this.controller, required this.hasTitle})
      : super(key: key);
  final AnimationController controller;
  final bool hasTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: hasTitle
          ? Theme.of(context).primaryColor
          : Color.fromARGB(166, 255, 255, 255),
      child: InkWell(
        onTap: () {
          if (controller.isCompleted) controller.reverse();
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            child: Icon(
              Icons.arrow_back_ios,
              color: hasTitle ? Colors.white : Colors.black,
              size: 23,
            ),
          ),
        ),
      ),
    );
  }
}
