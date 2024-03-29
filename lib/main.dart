import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/custom_painter_canvas_guide_page.dart';
import 'package:flutter_custom_painter/custom_painter_canvas_page.dart';

import 'custom_painter_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const CustomPainterHomePage(),

      home: const CustomPainterCanvasGuidePage(),

      // home: CustomPainterCanvasPage(),
    );
  }
}
