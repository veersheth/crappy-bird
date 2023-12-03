import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final tileHeight;
  final tileWidth;
  const Tile({super.key, required this.tileHeight, this.tileWidth});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1),
      child: Container(
        width: 100,
        height: tileHeight,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.green[900]!,
            width: tileWidth,
          ),
        ),
      ),
    );
  }
}
