// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flappy/Snake/startsnake.dart';
import 'package:flappy/first.dart';
import 'package:flappy/homepage.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDirector =
  //     await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirector.path);
  // await Hive.openBox("BestScore");
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
      home: CustomNavi(),
    );
  }
}

class CustomNavi extends StatelessWidget {
  const CustomNavi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Column(
        children: [
          SizedBox(
            height: 40,
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
                color: Colors.blue[100],
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
                color: Colors.blue[100],
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
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Adder(
                //     setstate()
                color: Colors.blue[100],
                x: 0,
                y: 0.5,
                image: 'assets/images/angrybird.png',
                name: "Angrybird",
              )),
        ],
      ),
    );
  }
}
