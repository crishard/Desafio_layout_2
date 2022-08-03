import 'package:flutter/material.dart';

class BotaoFavorito extends StatelessWidget {
  const BotaoFavorito({Key? key, required this.favorito, required this.funcao}) : super(key: key);
  final bool favorito;
  final Function()? funcao;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const CircleBorder(),
      elevation: 0,
      // ignore: sort_child_properties_last
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: funcao,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(favorito ? Icons.favorite : Icons.favorite_border, color: Colors.white),
        ),
      ),
      color: Theme.of(context).primaryColor,
    );
    
  }
}
