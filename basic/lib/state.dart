import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'boardeval.dart';

class board extends StatefulWidget {
  const board({Key? key}) : super(key: key);

  static List<int> boardState = List.generate(9, (index) => -1);

  @override
  _board createState() => _board();
}

class _board extends State<board> {
  static const double size = 500.0;

  static List<Color> state = List.generate(9, (index) => Colors.black);
  static int cur = 0;
  static String winner = "";

  _restart(){
    BoardEvaluation.win = false;
    cur = 0;
    setState(() {
      state = List.generate(9, (index) => Colors.black);
      board.boardState = List.generate(9, (index) => -1);
    });
  }

  _changeColor(index){
    setState(() {
      if(board.boardState[index]==-1 && !BoardEvaluation.win) {
        if (cur == 0) {
          state[index] = Colors.green;
          board.boardState[index] = 0;
          cur = 1;
        } else {
          state[index] = Colors.yellow;
          board.boardState[index] = 1;
          cur = 0;
        }BoardEvaluation.update();
      }BoardEvaluation.getWin();
      winner = BoardEvaluation.printWin(cur);
    });
  }
  
  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Flexible(
        flex: 65,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(9, (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
                child: AnimatedContainer(
                  color: state[index],
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                ),
                onTap: () => _changeColor(index),
                ),
              ),
            ),
          ),
        ),
      ),
      Flexible(
        flex: 12,
        child: Visibility(
          visible: BoardEvaluation.win,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          child: AnimatedSwitcher(
            child: Text(
              winner,
              key: ValueKey<String>(winner),
              style: const TextStyle(fontSize: 24),
            ),
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (Widget child, Animation<double> animation){
              return ScaleTransition(
                  child: child,
                  scale: animation);
            },
          ),
        ),
      ),
      Flexible(
        flex: 23,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.5, bottom: 1),
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => _restart(),
                ),const Text("Reset"),
              ]
            )
          ),
        ),
      )
    ],
  );
}
