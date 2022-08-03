import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class NomeEvento extends StatelessWidget {
  const NomeEvento({Key? key, required this.nome}) : super(key: key);
  final dynamic nome;
  @override
  Widget build(BuildContext context) {
    return Text(
      nome,
      style: headerStyle.copyWith(fontSize: 32),
    );
  }
}










