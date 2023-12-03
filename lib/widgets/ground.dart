import 'package:flutter/material.dart';

class Ground extends StatelessWidget {
  const Ground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          color: Colors.green,
        ),
        Expanded(
            child: Container(
          color: Colors.brown,
        ))
      ],
    );
  }
}
