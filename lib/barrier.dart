// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  double size;
  Barrier({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.green[800],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 5,
            color: Colors.green,
          ),
        ));
  }
}
