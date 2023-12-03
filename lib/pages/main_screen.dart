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
  bool gameStarted = false;

  void beginGame() {
    gameStarted = true;
  }

  void jump() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: gameStarted ? beginGame : jump,
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
                  )
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
