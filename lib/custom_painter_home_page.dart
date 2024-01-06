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
    paint.style = PaintingStyle.fill;

    Rect bigRect = Rect.fromLTRB(10, 20, 100, 200);

    Rect smallRect = Rect.fromLTRB(20, 30, 100, 180);

    RRect bigRRect = RRect.fromRectXY(bigRect, 75, 25);

    RRect smallRRect = RRect.fromRectXY(smallRect, 75, 25);

    canvas.drawDRRect(bigRRect, smallRRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
