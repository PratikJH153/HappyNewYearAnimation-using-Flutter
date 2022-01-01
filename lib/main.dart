import 'package:flutter/material.dart';
import 'package:happynewyearapp/views/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Happy New Year 2022",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1f1f1f),
        primaryColor: const Color(0xFFf2f4f9),
      ),
      home: HomePage(),
    );
  }
}
