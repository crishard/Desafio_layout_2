import 'package:desafio_layout_2/constants/colors.dart';
import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';

class InformacoesOrganizacao extends StatelessWidget {
  const InformacoesOrganizacao(
      {Key? key, required this.organizacao1, required this.organizadorEvento})
      : super(key: key);
  final dynamic organizacao1;
  final dynamic organizadorEvento;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          child: Text(organizacao1),
        ),
        SizeHelper.horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(organizadorEvento, style: titleStyle),
            SizeHelper.verticalSpace(4),
            const Text("Organizer", style: subtitleStyle),
          ],
        ),
        const Spacer(),
        TextButton(
          child: Text("Follow",
              style: TextStyle(color: Theme.of(context).primaryColor)),
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            primary: primaryLight,
          ),
        )
      ],
    );
  }
}
