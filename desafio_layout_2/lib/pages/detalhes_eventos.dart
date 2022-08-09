import 'dart:ui';

import 'package:desafio_layout_2/models/evento_model.dart';
import 'package:desafio_layout_2/utils/date_time_utils.dart';
import 'package:desafio_layout_2/widgets/barra_interacao.dart';
import 'package:desafio_layout_2/widgets/data_evento.dart';
import 'package:desafio_layout_2/widgets/imagem_header.dart';
import 'package:desafio_layout_2/widgets/informacoes_organizacao.dart';
import 'package:desafio_layout_2/widgets/informacoes_preco.dart';
import 'package:desafio_layout_2/widgets/local_evento.dart';
import 'package:desafio_layout_2/widgets/nome_evento.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:desafio_layout_2/widgets/sobre_evento.dart';
import 'package:flutter/material.dart';

class PaginaDetalhesEventos extends StatefulWidget {
  final Evento event;
  const PaginaDetalhesEventos(this.event, {Key? key}) : super(key: key);
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<PaginaDetalhesEventos>
    with TickerProviderStateMixin {
  late Evento event;
  late AnimationController controller;
  late AnimationController bodyScrollAnimationController;
  late ScrollController scrollController;
  late Animation<double> scale;
  late Animation<double> appBarSlide;
  final bool has = true;
  double headerImageSize = 0;
  bool isFavorite = false;

  @override
  void dispose() {
    controller.dispose();
    bodyScrollAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    event = widget.event;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    bodyScrollAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= headerImageSize / 2) {
          if (!bodyScrollAnimationController.isCompleted)
            bodyScrollAnimationController.forward();
        } else {
          if (bodyScrollAnimationController.isCompleted)
            bodyScrollAnimationController.reverse();
        }
      });

    appBarSlide = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: bodyScrollAnimationController,
    ));

    scale = Tween(begin: 1.0, end: 0.5).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: controller,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    headerImageSize = MediaQuery.of(context).size.height / 2.5;
    return ScaleTransition(
      scale: scale,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ImagemHeader(
                      imageSize: headerImageSize,
                      image: event.image,
                      controller: controller,
                      scale: scale,
                      favorito: isFavorite,
                      nome: event.name,
                      funcao: () => setState(() => isFavorite = !isFavorite),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NomeEvento(nome: event.name),
                          SizeHelper.verticalSpace(16),
                          DataEvento(
                              diaDaSemana:
                                  DateTimeUtils.getDayOfWeek(event.eventDate),
                              diaDoMes:
                                  DateTimeUtils.getDayOfMonth(event.eventDate),
                              mes: DateTimeUtils.getMonth(event.eventDate)),
                          SizeHelper.verticalSpace(24),
                          SobreEventos(text: event.description),
                          SizeHelper.verticalSpace(24),
                          InformacoesOrganizacao(
                              organizacao1: event.organizer[0],
                              organizadorEvento: event.organizer),
                          SizeHelper.verticalSpace(24),
                          const LocalEvento(),
                          SizeHelper.verticalSpace(124),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                child: InformacoesPreco(preco: event.price),
                alignment: Alignment.bottomCenter,
              ),
              AnimatedBuilder(
                animation: appBarSlide,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(0.0, -1000 * (1 - appBarSlide.value)),
                    child: Material(
                      elevation: 2,
                      color: Theme.of(context).primaryColor,
                      child: BarraInteracao(
                        hasTitle: has,
                        nome: event.name,
                        funcao: () => setState(() => isFavorite = !isFavorite),
                        controller: controller,
                        favorito: isFavorite,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
