import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/widgets/botao_favorito.dart';
import 'package:desafio_layout_2/widgets/botao_voltar.dart';
import 'package:flutter/material.dart';

class BarraInteracao extends StatelessWidget {
  BarraInteracao(
      {Key? key,
      required this.nome,
      required this.hasTitle,
      required this.funcao,
      required this.controller,
      required this.favorito})
      : super(key: key);
  final AnimationController controller;
  final dynamic nome;
  final Function()? funcao;
  final bool favorito;
  bool hasTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BoTaoVoltar(controller: controller, hasTitle: hasTitle),
            if (hasTitle)
              Text(nome, style: titleStyle.copyWith(color: Colors.white)),
            BotaoFavorito(favorito: favorito, funcao: funcao)
          ],
        ),
      ),
    );
  }
}
