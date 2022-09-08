import 'package:flutter/material.dart';
import 'package:reddit_clone_single_page/view/time_line_page/view_time_line.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ViewTimeLine(),
      debugShowCheckedModeBanner: false,
    );
  }
}
