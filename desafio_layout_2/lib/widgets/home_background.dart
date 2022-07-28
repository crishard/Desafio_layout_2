import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:desafio_layout_2/constants/colors.dart';

class HomeBackgroundColor extends AnimatedWidget {
  final Animation<double> opacity;
  const HomeBackgroundColor(this.opacity, {Key? key}) : super(key: key, listenable: opacity);

  Animation<double> get progress => opacity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Stack(
        children: [
         Positioned(
            child: Container(
              height: (MediaQuery.of(context).size.height / 2.5) * progress.value,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(lerpDouble(0.5, 1.0, progress.value) ?? 1.0),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}