import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class CompraIngresso extends StatelessWidget {
  const CompraIngresso({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        primary: Theme.of(context).primaryColor,
      ),
      onPressed: () {},
      child: Text(
        "Get a Ticket",
        style: titleStyle.copyWith(
            color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }
}
