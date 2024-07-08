import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Named Routes Demo",
      initialRoute: "/",
      home: HomeScreen(),
      routes: {},
    );
  }
}
