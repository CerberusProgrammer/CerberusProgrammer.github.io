import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  final double newPercent;
  final Widget widget;
  final Gradient? gradient;
  final Color mainColor;
  final Color backgroundColor;
  final double? primaryStrokeWidth;
  final double? backgroundStrokeWidth;

  const CircularProgress({
    super.key,
    required this.newPercent,
    required this.widget,
    this.gradient,
    required this.mainColor,
    required this.backgroundColor,
    this.primaryStrokeWidth = 20,
    this.backgroundStrokeWidth = 20,
  });

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double percent = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    final Tween<double> tween = Tween(begin: 0, end: widget.newPercent);

    animationController.addListener(() {
      setState(() {
        percent = tween.evaluate(animationController);
      });
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: _MyRadialProgress(
              percent: percent,
              gradient: widget.gradient,
              mainColor: widget.mainColor,
              backgroundColor: widget.backgroundColor,
              primaryStrokeWidth: widget.primaryStrokeWidth,
              backgroundStrokeWidth: widget.backgroundStrokeWidth,
            ),
          ),
        ),
        SizedBox(width: 80, height: 80, child: widget.widget),
      ],
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percent;
  final Gradient? gradient;
  final Color mainColor;
  final Color backgroundColor;
  final double? primaryStrokeWidth;
  final double? backgroundStrokeWidth;

  _MyRadialProgress({
    required this.percent,
    this.gradient,
    required this.mainColor,
    required this.backgroundColor,
    this.primaryStrokeWidth = 20,
    this.backgroundStrokeWidth = 20,
  }) : assert(percent <= 100, 'Cannot be more than 100.');

  @override
  void paint(Canvas canvas, Size size) {
    // Circle
    final pencil = Paint();
    pencil.color = backgroundColor;
    pencil.style = PaintingStyle.stroke;
    pencil.strokeWidth = backgroundStrokeWidth!;

    Offset center = Offset(
      size.width / 2,
      size.width / 2,
    );
    double radio = min(
      size.width / 2,
      size.height / 2,
    );

    canvas.drawCircle(center, radio, pencil);

    // Arc
    final Rect rect = Rect.fromCircle(
      center: Offset(0, size.width * .5),
      radius: 100,
    );

    final pencilArc = Paint()..shader = gradient?.createShader(rect);
    pencilArc.color = mainColor;
    pencilArc.style = PaintingStyle.stroke;
    pencilArc.strokeWidth = primaryStrokeWidth!;

    double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radio,
      ),
      -pi / 2,
      arcAngle,
      false,
      pencilArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
