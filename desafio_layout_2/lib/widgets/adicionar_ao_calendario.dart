import 'package:desafio_layout_2/constants/colors.dart';
import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';

class AdicionarAoCalendario extends StatelessWidget {
  const AdicionarAoCalendario({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: const ShapeDecoration(shape: StadiumBorder(), color: primaryLight),
          child: Row(
            children:[
              // SizeHelper.horizontalSpace(12),
              Text("Add to calendar", style: subtitleStyle.copyWith(color: Theme.of(context).primaryColor)),
              FloatingActionButton(
                mini: true,
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ]
          )
    );
  }
}
