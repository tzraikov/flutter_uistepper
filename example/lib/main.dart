import 'package:flutter/material.dart';
import 'package:uistepper/uistepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(child: Center(child: UIStepper(value: 12, onChanged: (value) {})))
      ),
    );
  }
}
