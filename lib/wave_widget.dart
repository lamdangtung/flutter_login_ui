import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/clipper_widget.dart';

class WaveWidget extends StatefulWidget {
  const WaveWidget(
      {Key? key,
      required this.size,
      required this.yOffset,
      required this.color})
      : super(key: key);
  final Size size;
  final double yOffset;
  final Color color;

  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000))
      ..addListener(() {
        wavePoints.clear();
        final double waveSpeed = animationController.value * 1080;
        final double fullSphere = animationController.value * Math.pi * 2;
        final double normalizer = Math.cos(fullSphere);
        final double waveWidth = Math.pi / 270.0;
        final double waveHeight = 20.0;

        for (int i = 0; i <= widget.size.width; i++) {
          wavePoints.add(Offset(
              i.toDouble(),
              Math.sin((waveSpeed - i) * waveWidth) * waveHeight * normalizer +
                  widget.yOffset));
        }
      });
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return ClipPath(
          clipper: ClipperWidget(waveList: wavePoints),
          child: Container(
            height: widget.size.height,
            width: widget.size.width,
            color: widget.color,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
