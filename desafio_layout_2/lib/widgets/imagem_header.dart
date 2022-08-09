import 'package:desafio_layout_2/widgets/barra_interacao.dart';
import 'package:desafio_layout_2/widgets/images_evento.dart';
import 'package:flutter/material.dart';

class ImagemHeader extends StatelessWidget {
  ImagemHeader({
    Key? key,
    required this.imageSize,
    required this.image,
    required this.controller,
    required this.scale,
    required this.favorito,
    required this.nome,
    required this.funcao,
  }) : super(key: key);
  final AnimationController controller;
  final Animation<double> scale;
  final dynamic nome;
  final Function()? funcao;
  final bool favorito;
  bool hasTitle = false;
  double imageSize;
  final dynamic image;

  double minimumScale = 0.8;
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onVerticalDragUpdate: (detail) {
        controller.value += detail.primaryDelta! / maxHeight * 2;
      },
      onVerticalDragEnd: (detail) {
        if (scale.value > minimumScale) {
          controller.reverse();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: <Widget>[
          ImagemEvento(imageSize: imageSize, image: image),
          BarraInteracao(
            nome: nome,
            funcao: funcao,
            controller: controller,
            favorito: favorito,
            hasTitle: hasTitle,
          ),
        ],
      ),
    );
  }
}
