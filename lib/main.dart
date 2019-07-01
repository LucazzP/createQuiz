// Flutter code sample for widgets.Expanded.2

// This example shows how to use an [Expanded] widget in a [Row] with multiple
// children expanded, utilizing the [flex] factor to prioritize available space.

import 'package:create_quiz/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}