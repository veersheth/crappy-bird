import 'dart:async';

import 'package:crappy_bird/widgets/Ground.dart';
import 'package:crappy_bird/widgets/bird.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static double birdY = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdY;
  bool gameStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdY;
    });
  }

  void beginGame() {
    setState(() {
      gameStarted = true;

      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.04;
        height = -4.9 * time * time + 2.8 * time;
        setState(() {
          birdY = initialHeight - height;
        });

        if (birdY >= 0.9) {
          timer.cancel();
          birdY = 0;
          time = 0;
          initialHeight = birdY;
          gameStarted = false;
          // jump();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: gameStarted ? jump : beginGame,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  AnimatedContainer(
                    //sky
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(0, birdY),
                    color: Colors.blue[200],
                    child: const Bird(),
                  ),
                  Container(
                    alignment: Alignment(0, -0.5),
                    child: Text(
                      gameStarted ? "" : "c r a p p y    b i r d",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Ground(),
            ),
          ],
        ),
      ),
    );
  }
}
