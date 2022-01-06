// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flappy/Snake/startsnake.dart';
import 'package:flappy/chess/chessss.dart';
import 'package:flappy/first.dart';
import 'package:flappy/homepage.dart';
import 'package:flappy/splashscreen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Birds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class CustomNavi extends StatelessWidget {
  const CustomNavi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          SizedBox(
            height: 40,
            // width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(10)),
            child: Text(
              "GameZone",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Adder(
                //     setstate()
                color: Colors.teal[300],
                x: 0,
                y: 0.5,
                image: 'assets/images/angrybird.png',
                name: "Angrybird",
              )),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Snakegame()),
                );
              },
              child: Adder(
                //     setstate()
                color: Colors.teal[300],
                x: 0,
                y: 0.5,
                image: 'assets/images/s.png',
                name: "Snake",
              )),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chess()),
                );
              },
              child: Adder(
                //     setstate()
                color: Colors.teal[300],
                x: 0,
                y: 0.5,
                image: 'assets/images/chess1.png',
                name: "Chess",
              )),
        ],
      ),
    );
  }
}
