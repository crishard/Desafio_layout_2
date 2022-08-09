import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/models/evento_model.dart';
import 'package:desafio_layout_2/pages/detalhes_eventos.dart';
import 'package:desafio_layout_2/utils/app_utils.dart';
import 'package:desafio_layout_2/widgets/card_proximos_eventos.dart';
import 'package:desafio_layout_2/widgets/home_background.dart';
import 'package:desafio_layout_2/widgets/home_page_navigationbar.dart';
import 'package:desafio_layout_2/widgets/proximidade_eventos.dart';
import 'package:desafio_layout_2/widgets/search_app.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;

  late ScrollController scrollController;
  late Animation<double> opacity;
  late AnimationController controller;
  late AnimationController opacityController;

  void viewEventDetail(Evento event) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: PaginaDetalhesEventos(event),
          );
        },
      ),
    );
  }

  void initState() {
    scrollController = ScrollController();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    opacityController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1));
    opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: opacityController,
    ));
    scrollController.addListener(() {
      opacityController.value = offsetToOpacity(
          currentOffset: scrollController.offset,
          maxOffset: scrollController.position.maxScrollExtent / 2);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeBackgroundColor(opacity),
          SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchApp(),
                SizeHelper.verticalSpace(16),
                proximosEvents(),
                SizeHelper.verticalSpace(16),
                eventosNaProximidade(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomePageButtonNavigationBar(
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner_sharp),
      ),
    );
  }

  Widget proximosEvents() {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Upcoming Events",
              style: headerStyle.copyWith(color: Colors.white)),
          SizeHelper.verticalSpace(16),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: proximosEventos.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final event = proximosEventos[index];
                return CardPRoximosEventos(
                    event: event, onTap: () => viewEventDetail(event));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget eventosNaProximidade() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Nearby Concerts", style: headerStyle),
              const Spacer(),
              const Icon(Icons.more_horiz),
              SizeHelper.horizontalSpace(16),
            ],
          ),
          ListView.builder(
            itemCount: eventosProximidade.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final event = eventosProximidade[index];
              var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: controller,
                  curve: Interval((1 / eventosProximidade.length) * index, 1.0,
                      curve: Curves.decelerate),
                ),
              );
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) => Transform.translate(
                  offset: Offset(animation.value, 0.0),
                  child: EventosProximidade(
                    event: event,
                    onTap: () => viewEventDetail(event),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
