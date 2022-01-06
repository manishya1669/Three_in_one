// // ignore_for_file: prefer_typing_uninitialized_variables

// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class Chess extends StatefulWidget {
  final pos;
  const Chess({Key? key, this.pos}) : super(key: key);
  //const Chess({Key? key}) : super(key: key);

  @override
  _ChessState createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  ChessBoardController controller = ChessBoardController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // Do something here
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   tcolor = tcolor;
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text("Chess.com",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800)),
        ),
        // backgroundColor: Colors.white10,
      ),
      body: Column(
        children: [
          ChessBoard(
            controller: controller,
            boardColor: BoardColor.orange,
            boardOrientation: PlayerColor.white,
            onMove: () {},
            size: MediaQuery.of(context).size.width,
            enableUserMoves: true,

            //Expanded(child: chil
          ),
        ],
      ),
    );
  }
}
