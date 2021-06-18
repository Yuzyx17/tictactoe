import 'package:flutter/material.dart';
import 'state.dart';

void main() => runApp(MainApp());

const String title = "Tac Toc Tie";
const String name = "Tikitactak";

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    home: _Home(),
  );
}

class _Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) => SafeArea(
      child:Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(10, 10),
                    blurRadius: 7.5,
                    spreadRadius: -7.5
                  )],
              ),
              child: board(),
            ),
          )
        ),
      ),
    ),
  );
}