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
    ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
    );

    ui.TextStyle textStyle = ui.TextStyle(color: Colors.indigo);
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);

    paragraphBuilder.pushStyle(textStyle);
    paragraphBuilder.addText("Hello Flutter Community \n \n From Manoj");

    ui.Paragraph paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: size.width));
    canvas.drawParagraph(paragraph, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
