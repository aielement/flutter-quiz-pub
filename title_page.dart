import 'package:flutter/material.dart';
import 'package:flutter_quiz/main.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'クイズデモ',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(title: 'クイズデモ');
                },
              ),
            );
          },
          color: Colors.blueAccent,
          textColor: Colors.white,
          child: Text('開始'),
        )
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    )));
  }
}
