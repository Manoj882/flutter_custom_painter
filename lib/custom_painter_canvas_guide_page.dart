import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class CustomPainterCanvasGuidePage extends StatefulWidget {
  const CustomPainterCanvasGuidePage({super.key});

  @override
  State<CustomPainterCanvasGuidePage> createState() =>
      _CustomPainterCanvasGuidePageState();
}

class _CustomPainterCanvasGuidePageState
    extends State<CustomPainterCanvasGuidePage> {
  AnimationController? _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Guide'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: CustomPainterCanvasGuide(
              animationController: _animationController,
            ),
            size: const Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class CustomPainterCanvasGuide extends CustomPainter {
  CustomPainterCanvasGuide({AnimationController? animationController})
      : _animationController = animationController,
        super(repaint: animationController);

  final AnimationController? _animationController;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.black;

    final Float32List points = Float32List.fromList([
      0,
      0,
      size.width,
      0,
      size.width / 2,
      size.height / 2,
      0,
      0,
    ]);

    canvas.drawRawPoints(ui.PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
