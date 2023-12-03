import 'dart:async';
import 'dart:math';

import 'package:crappy_bird/widgets/Ground.dart';
import 'package:crappy_bird/widgets/bird.dart';
import 'package:crappy_bird/widgets/game_over.dart';
import 'package:crappy_bird/widgets/tiles.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const double birdWidth = 55;
  static const double birdHeight = 55;
  static const double tileWidth = 20;
  static const double tileHeight = 200;

  static double birdY = 0.5;

  double time = 0;
  double height = 0;
  double initialHeight = birdY;
  bool gameStarted = false;
  int numTiles = 0;

  List<double> tileX = [];
  List<double> tileY = [];

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdY;
    });
  }

  void createTiles(int num) {
    Random random = Random();
    numTiles = num;
    double initBuffer = 5.0;
    for (int i = 0; i < num; i++) {
      tileX.add(initBuffer + i * 2);
      tileY.add(2 * random.nextDouble() - 1);
    }
  }

  void beginGame() {
    createTiles(8);
    setState(() {
      gameStarted = true;

      Timer.periodic(const Duration(milliseconds: 50), (timer) {
        time += 0.04;

        height = -4.9 * time * time + 2.8 * time;
        setState(() {
          birdY = initialHeight - height;
          if (tileX[0] <= -1.8) {
            tileX.removeAt(0);
            tileX.add(numTiles * 1.8);
            tileY.removeAt(0);
            tileY.add(2 * Random().nextDouble() - 1);
          }
          for (int i = 0; i < numTiles; i++) {
            tileX[i] -= 0.1;
          }
        });

        if (birdY >= 0.9 || checkCollision()) {
          showDialog(context: context, builder: (context) => GameOver());
          timer.cancel();
          birdY = 0;
          time = 0;
          initialHeight = birdY;
          gameStarted = false;
          tileX = [];
          numTiles = 0;
          // jump();
        }
      });
    });
  }

  bool checkCollision() {
    // for (int i = 0; i < numTiles; i++) {
    //   // Check if the bird's position overlaps with the current tile's position
    //   bool condition1 = birdY + birdHeight / 2 > tileY[i] - tileHeight / 2;
    //   bool condition2 = birdY - birdHeight / 2 < tileY[i] + tileHeight / 2;
    //   bool condition3 = 0 + birdWidth / 2 > tileX[i] - tileWidth / 2;
    //   bool condition4 = 0 - birdWidth / 2 < tileX[i] + tileWidth / 2;

    //   print('Condition 1: $condition1');
    //   print('Condition 2: $condition2');
    //   print('Condition 3: $condition3');
    //   print('Condition 4: $condition4');

    //   if (condition1 && condition2 && condition3 && condition4) {
    //     return true;
    //   }
    // }
    return false;
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
                    child: const Bird(
                      birdHeight: birdHeight,
                      birdWidth: birdWidth,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, -0.5),
                    child: Text(
                      gameStarted ? "" : "c r a p p y   b i r d",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  for (int i = 0; i < numTiles; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 10),
                      alignment: Alignment(
                          tileX[i], tileY[i]), // Use the random y-coordinate
                      child: const Tile(
                        tileHeight: tileHeight,
                        tileWidth: tileWidth,
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
