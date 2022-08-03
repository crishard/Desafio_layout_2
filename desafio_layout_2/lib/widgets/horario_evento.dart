import 'package:desafio_layout_2/constants/colors.dart';
import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/utils/date_time_utils.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';

class HorarioEvento extends StatelessWidget {
  const HorarioEvento({Key? key, required this.diaDaSemana}) : super(key: key);
  final dynamic diaDaSemana;
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(diaDaSemana, style: titleStyle),
            SizeHelper.verticalSpace(4),
            const Text("10:00 - 12:00 PM", style: subtitleStyle),
          ],
        );
  }
}