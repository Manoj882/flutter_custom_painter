import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomPainterCanvasPage extends StatefulWidget {
  const CustomPainterCanvasPage({super.key});

  @override
  State<CustomPainterCanvasPage> createState() =>
      _CustomPainterCanvasPageState();
}

class _CustomPainterCanvasPageState extends State<CustomPainterCanvasPage> {
  ValueNotifier<ui.Image?> imageNotifier = ValueNotifier<ui.Image?>(null);

  getImage() {
    NetworkImage networkImage = NetworkImage(
        'http://digitalcommunications.wp.st-andrews.ac.uk/files/2019/04/JPEG_compression_Example.jpg');

    ImageStream imageStream = networkImage.resolve(ImageConfiguration.empty);

    ImageStreamListener imageStreamListener =
        ImageStreamListener((imageInfo, synchronousCall) {
      imageNotifier.value = imageInfo.image;
    });

    imageStream.addListener(imageStreamListener);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw image on canvas'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: CustomPaint(
            painter: CustomPainterCanvas(imageInfoProvider: imageNotifier),
            size: const Size(300, 400),
          ),
        ),
      ),
    );
  }
}

class CustomPainterCanvas extends CustomPainter {
  CustomPainterCanvas({
    required this.imageInfoProvider,
  }) : super(repaint: imageInfoProvider);

  final ValueNotifier<ui.Image?> imageInfoProvider;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black;

    ui.Image? image = imageInfoProvider.value;

    if (image != null) {
      canvas.drawImage(image, Offset.zero, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
