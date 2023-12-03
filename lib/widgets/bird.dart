import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(100),
      ),
      height: 55,
      width: 55,
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
