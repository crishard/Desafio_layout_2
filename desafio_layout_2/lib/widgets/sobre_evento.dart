import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';

class SobreEventos extends StatelessWidget {

  const SobreEventos({Key? key, required this.text}) : super(key: key);
  final dynamic text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("About", style: headerStyle),
        SizeHelper.verticalSpace(),
        Text(text, style: subtitleStyle),
        SizeHelper.verticalSpace(8),
        InkWell(
          child: Text(
            "Read more...",
            style: TextStyle(color: Theme.of(context).primaryColor, decoration: TextDecoration.underline),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}