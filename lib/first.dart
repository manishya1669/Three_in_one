// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flappy/shadowcustom.dart';
import 'package:flutter/material.dart';

class Adder extends StatelessWidget {
  final image;
  final name;
  final subname;
  final navigate;
  final color;
  double x;
  double y;
  // ignore: use_key_in_widget_constructors
  Adder(
      {this.name,
      this.image,
      this.navigate,
      this.subname,
      required this.x,
      required this.y,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(x, y),
      child: Column(
        children: [
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              boxShadow: customShadow,
              color: color,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
