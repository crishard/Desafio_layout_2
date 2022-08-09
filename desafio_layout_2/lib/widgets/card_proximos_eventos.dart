import 'package:desafio_layout_2/constants/colors.dart';
import 'package:desafio_layout_2/constants/text_style.dart';
import 'package:desafio_layout_2/models/evento_model.dart';
import 'package:desafio_layout_2/utils/date_time_utils.dart';
import 'package:desafio_layout_2/widgets/sizebox_help.dart';
import 'package:flutter/material.dart';

class CardPRoximosEventos extends StatelessWidget {
  final Evento event;
  final VoidCallback onTap;
  const CardPRoximosEventos(
      {Key? key, required this.event, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          Expanded(child: buildImage()),
          SizeHelper.verticalSpace(24),
          buildEventInfo(context),
        ],
      ),
    );
  }

  Widget buildImage() {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: imgBG,
          width: double.infinity,
          child: Hero(
            tag: event.image,
            child: Image.network(
              event.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: primaryLight,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(DateTimeUtils.getMonth(event.eventDate), style: monthStyle),
              Text(DateTimeUtils.getDayOfMonth(event.eventDate),
                  style: titleStyle),
            ],
          ),
        ),
        SizeHelper.horizontalSpace(16),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(event.name, style: titleStyle),
            SizeHelper.verticalSpace(4),
            Row(
              children: <Widget>[
                Icon(Icons.location_on,
                    size: 16, color: Theme.of(context).primaryColor),
                SizeHelper.horizontalSpace(4),
                Text(event.location.toUpperCase(), style: subtitleStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
