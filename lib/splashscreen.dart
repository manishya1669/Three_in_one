// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:async';

//import 'package:flappy/first.dart';
//import 'package:flappy/homepage.dart';
import 'package:flappy/main.dart';
import 'package:flutter/material.dart';
//import 'package:async/async.dart';

class SplashScreen extends StatefulWidget {
  final image;
  const SplashScreen({Key? key, this.image}) : super(key: key);
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CustomNavi())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        //fit: StackFit.expand,
        children: [
          // Container(
          //   color: Colors.teal,
          // ),

          Positioned(
            left: 30.0,
            top: 30.0,
            child: new Container(
              width: 300,

              height: MediaQuery.of(context).size.height / 2,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/gz.png")),
                  color: Colors.teal),
              // child: new Text('hello'),
              // child: CircularProgressIndicator(
              //   color: Colors.white,
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
              // ),
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.tealAccent),
            ),
          ),

          // Container(
          //   child: Text("GZ..."),
          // ),
        ],
      ),
    );
  }
}
