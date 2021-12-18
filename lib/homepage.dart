// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flappy/barrier.dart';
import 'package:flappy/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  bool isgameStarted = false;
  double initHeight = birdYaxis;
  double barrierXone = 1.0;
  double barrierXtwo = 1.8 + 1.5;
  double barrierXthree = 1.8 + 3;

  int bestScore = 0;
  int score = 0;

  void initstate() {
    setState(() {
      birdYaxis = 0;
      time = 0;
      isgameStarted = false;
      initHeight = birdYaxis;
      barrierXone = 1.0;
      barrierXtwo = 1.8 + 1.5;
      barrierXthree = 1.8 + 3;
      score = 0;
      //initHiveBestScore();

      // sup
      super.initState();
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initHeight = birdYaxis;
    });
  }

  // void initHiveBestScore() {
  //   bestScore = (bestScoreHive.get('Score') ?? 0);
  // }
  void onInit() {
    setState(() {
      birdYaxis = 0;
      time = 0;
      isgameStarted = false;
      initHeight = birdYaxis;
      barrierXone = 1.0;
      barrierXtwo = 1.8 + 1.5;
      barrierXthree = 1.8 + 3;
      score = 0;
    });
  }

  bool checkBarrierLost() {
    if (barrierXone < 0.2 && barrierXone > -0.2) {
      if (birdYaxis < -0.3 || birdYaxis > 0.7) {
        return true;
      }
    }
    if (barrierXtwo < 0.2 && barrierXtwo > -0.2) {
      if (birdYaxis < -0.8 || birdYaxis > 0.4) {
        return true;
      }
    }
    if (barrierXthree < 0.2 && barrierXthree > -0.2) {
      if (birdYaxis < -0.4 || birdYaxis > 0.7) {
        return true;
      }
    }
    return false;
  }

  void startGame() {
    isgameStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.0 * time;

      setState(() {
        birdYaxis = initHeight - height;

        if (barrierXone < -2) {
          score++;
          barrierXone += 4.5;
        } else {
          barrierXone -= 0.04;
        }

        if (barrierXtwo < -2) {
          score++;
          barrierXtwo += 4.5;
        } else {
          barrierXtwo -= 0.04;
        }

        if (barrierXthree < -2) {
          score++;
          barrierXthree += 4.5;
        } else {
          barrierXthree -= 0.04;
        }
      });

      if (birdYaxis > 1 || checkBarrierLost()) {
        timer.cancel();
        isgameStarted = false;
        _showDialog();
      }
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Text(
              "Game Over",
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'Score ${score.toString()}',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (score > bestScore) {
                    bestScore = score;
                    // bestScoreHive.put('Score', score);
                  }
                  onInit();
                  //      initState();
                  setState(() {
                    isgameStarted = false;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Start Game",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isgameStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      alignment: Alignment(0, birdYaxis),
                      color: Colors.blue,
                      child: Bird()),
                  Container(
                    alignment: const Alignment(0.9, -0.3),
                    child: isgameStarted
                        ? const Text("")
                        : const Text(
                            "T A P   T O   S T A R T",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                  ),
                  //1
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 130.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 250.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXthree, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 100.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 130.0,
                    ),
                  ),
                  // AnimatedContainer(
                  //   alignment: Alignment(barrierXtwo, -1.1),
                  //   duration: Duration(milliseconds: 0),
                  //   child: Barrier(
                  //     size: 100.0,
                  //   ),
                  // ),
                  //1
                  //2
                  AnimatedContainer(
                    alignment: Alignment(barrierXthree, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: Barrier(
                      size: 200.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
                    color: Colors.brown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text("SCORE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Text(score.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text("BEST",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Text(score.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
