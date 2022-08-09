import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/widgets/compra_ingresso.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';

class InformacoesPreco extends StatelessWidget {
  const InformacoesPreco({Key? key, required this.preco}) : super(key: key);
  final dynamic preco;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Price", style: subtitleStyle),
              SizeHelper.verticalSpace(8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "\$${preco}",
                        style: titleStyle.copyWith(
                            color: Theme.of(context).primaryColor)),
                    const TextSpan(
                        text: "/per person",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          const CompraIngresso(),
        ],
      ),
    );
  }
}
