import 'package:flutter/material.dart';

class CustomPainterHomePage extends StatefulWidget {
  const CustomPainterHomePage({super.key});

  @override
  State<CustomPainterHomePage> createState() => _CustomPainterHomePageState();
}

class _CustomPainterHomePageState extends State<CustomPainterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom Painter',
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: MasterPainter(),
            size: Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.strokeWidth = 2;
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);

    Rect rect = Rect.fromLTRB(10, 10, 100, 200);

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
