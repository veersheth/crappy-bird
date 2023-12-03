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
          alignment: Alignment.center,
          child: MaterialButton(
            color: Colors.brown[400],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            child: Text(
              "@ v e e r s h e t h",
              style: TextStyle(
                color: Colors.brown[200],
                fontSize: 20,
              ),
            ),
          ),
          color: Colors.brown,
        ))
      ],
    );
  }
}
