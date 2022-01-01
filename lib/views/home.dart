import 'dart:async';

import 'package:flutter/material.dart';
import '../helper/indices_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> toDraw = [];
  List<int> toDrawHeart = [];

  void intialized() {
    setState(() {
      toDraw = indices_start;
    });
  }

  void drawCountDown() {
    setState(() {
      toDraw = indices_3;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        toDraw = indices_2;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        toDraw = indices_1;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        toDraw = indices_2022_2;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        toDrawHeart = indices_heart;
      });
    });
    for (int i = 0; i < 20; i++) {
      Timer.periodic(const Duration(milliseconds: 500), (_) {
        setState(() {
          toDrawHeart = toDrawHeart.map((e) => e + 1).toList();
        });
      });
    }
  }

  @override
  void initState() {
    intialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 527,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 17,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (ctx, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: toDrawHeart.contains(index)
                        ? Colors.pink
                        : toDraw.contains(index)
                            ? Colors.white
                            : const Color(0xFF303030),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: drawCountDown,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "🎊   CELEBRATE   🎊",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
