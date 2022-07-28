import 'package:desafio_layout_2/models/evento_model.dart';
import 'package:flutter/material.dart';

class PaginaDetalhesEventos extends StatefulWidget {
  final Evento event;
  const PaginaDetalhesEventos(this.event, {Key? key}) : super(key: key);
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<PaginaDetalhesEventos> with TickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );

  }}