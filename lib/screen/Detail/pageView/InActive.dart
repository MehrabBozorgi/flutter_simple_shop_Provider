import 'package:flutter/material.dart';

class InActive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: 10,
      height: 10,
    );
  }
}