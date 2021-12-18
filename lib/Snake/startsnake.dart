// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Snakegame extends StatefulWidget {
  const Snakegame({Key? key}) : super(key: key);

  @override
  _SnakegameState createState() => _SnakegameState();
}

class _SnakegameState extends State<Snakegame> {
  final int squarePerRow = 20;
  final int squarePerCol = 40;
  final fontStyle = const TextStyle(color: Colors.white, fontSize: 20);

  final randomgen = Random();
  var snake = [
    [0, 1],
    [0, 0]
  ];
  var food = [0, 2];
  var direction = 'up';
  var isPlaying = false;

  void startGame() {
    const duration = Duration(milliseconds: 280);
    snake = [
      [(squarePerRow / 2).floor(), (squarePerCol / 2).floor()]
    ];
    snake.add([snake.first[0], snake.first[1] + 1]);
    createFood();
    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void moveSnake() {
    setState(() {
      switch (direction) {
        case 'up':
          snake.insert(0, [snake.first[0], snake.first[1] - 1]);
          break;

        case 'down':
          snake.insert(0, [snake.first[0], snake.first[1] + 1]);

          break;

        case 'left':
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);

          break;

        case 'right':
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);

          break;
      }
      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  createFood() {
    food = [
      randomgen.nextInt(squarePerRow),
      randomgen.nextInt(squarePerCol),
    ];
  }

  void endGame() {
    isPlaying = false;
    showDialog(
        context: context,
        builder: (BuildContext contet) {
          return AlertDialog(
            title: const Text("Game OVer"),
            content: Text(
              'Score: ${snake.length - 2}',
              style: const TextStyle(fontSize: 20),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close')),
            ],
          );
        });
  }

  bool checkGameOver() {
    if (!isPlaying ||
        snake.first[1] < 0 ||
        snake.first[1] >= squarePerCol ||
        snake.first[0] < 0 ||
        snake.first[0] > squarePerRow) {
      return true;
    }
    for (var i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][i] == snake.first[i]) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (direction != 'up' && details.delta.dy > 0) {
                        direction = 'down';
                      } else if (direction != 'down' && details.delta.dy < 0) {
                        direction = 'up';
                      }
                    },
                    onHorizontalDragUpdate: (details) {
                      if (direction != 'left' && details.delta.dx > 0) {
                        direction = 'right';
                      } else if (direction != 'right' && details.delta.dx < 0) {
                        direction = 'left';
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: squarePerRow / (squarePerCol + 2),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: squarePerRow),
                          itemCount: squarePerRow * squarePerCol,
                          itemBuilder: (BuildContext context, int index) {
                            var color;
                            var x = index % squarePerRow;
                            var y = (index / squarePerRow).floor();
                            bool isSnakeBody = false;
                            for (var pos in snake) {
                              if (pos[0] == x && pos[1] == y) {
                                isSnakeBody = true;
                                break;
                              }
                            }
                            if (snake.first[0] == x && snake.first[1] == y) {
                              color = Colors.green;
                            } else if (isSnakeBody) {
                              color = Colors.green[200];
                            } else if (food[0] == x && food[1] == y) {
                              color = Colors.red;
                            } else {
                              color = Colors.grey[800];
                            }

                            return Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                    ))),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: isPlaying ? Colors.red : Colors.blue,
                      onSurface: isPlaying ? Colors.red : Colors.blue,
                    ),
                    child: Text(isPlaying ? 'End' : 'Start'),
                    onPressed: () {
                      if (isPlaying) {
                        isPlaying = false;
                      } else {
                        startGame();
                      }
                    },
                  ),
                  Text(
                    'score:${snake.length - 2}',
                    style: fontStyle,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
