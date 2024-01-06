import 'package:flutter/material.dart';

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
    canvas.drawColor(Colors.indigo, BlendMode.src);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
