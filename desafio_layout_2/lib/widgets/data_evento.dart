import 'package:desafio_layout_2/constants/colors.dart';
import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/models/evento_model.dart';
import 'package:desafio_layout_2/utils/date_time_utils.dart';
import 'package:desafio_layout_2/widgets/adicionar_ao_calendario.dart';
import 'package:desafio_layout_2/widgets/horario_evento.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';

class DataEvento extends StatelessWidget {
  const DataEvento({Key? key, required this.diaDaSemana, required this.diaDoMes, required this.mes}) : super(key: key);
  final dynamic mes;
  final dynamic diaDoMes;
  final dynamic diaDaSemana;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: primaryLight,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(mes, style: monthStyle),
              Text(diaDoMes, style: titleStyle),
            ],
          ),
        ),
        // SizeHelper.horizontalSpace(12),
        HorarioEvento(diaDaSemana:diaDaSemana ),
        const AdicionarAoCalendario(),
            ],
    );
  }
}