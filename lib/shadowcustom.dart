import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFFCADCED);
Color blu = const Color(0xFF18659C);
List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.5),
    spreadRadius: -5,
    offset: const Offset(-5, -5),
    blurRadius: 30,
  ),
  BoxShadow(
    color: Colors.black.withOpacity(.5),
    spreadRadius: 2,
    offset: const Offset(7, 7),
    blurRadius: 20,
  )
];
