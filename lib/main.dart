import 'package:flutter/material.dart';
import 'package:app_lrt_jabodebek/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LRT_app',
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
