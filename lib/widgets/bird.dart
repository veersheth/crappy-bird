import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final double birdWidth;
  final double birdHeight;
  const Bird({super.key, required this.birdWidth, required this.birdHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(100),
      ),
      height: birdHeight,
      width: birdWidth,
      alignment: Alignment.center,
      // child: const Text(
      //   "O∨O",
      //   style: TextStyle(
      //     fontSize: 15, color: Colors.white,
      //     // fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }
}
