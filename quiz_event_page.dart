import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quiz/quiz.dart';

class QuizEventPage extends StatefulWidget {
  String quizEventDocumentId;

  QuizEventPage({Key key, this.quizEventDocumentId}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _QuizEventPageState(quizEventDocumentId);
}

class _QuizEventPageState extends State<QuizEventPage> {
  String quizEventDocumentId;

  _QuizEventPageState(String documentId) {
    quizEventDocumentId = documentId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: QuizList.quizList.length,
          itemBuilder: (BuildContext itemBuildContext, int index) {
            var quiz = QuizList.quizList[index];
            return Card(
                elevation: 2,
                color: Colors.white70,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Q' +
                                (index + 1).toString() +
                                "." +
                                quiz.questionString,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                      ButtonTheme(
                          minWidth: 250,
                          child: RaisedButton(
                            onPressed: () {
                              QuizList.quizList[index].inputAnswer(1);
                              setState(() {});
                            },
                            child: Text(
                              quiz.choice1String,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.blueAccent,
                            elevation: 5,
                          )),
                      ButtonTheme(
                          minWidth: 250,
                          child: RaisedButton(
                            onPressed: () {
                              QuizList.quizList[index].inputAnswer(2);
                              setState(() {});
                            },
                            child: Text(
                              quiz.choice2String,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.blueAccent,
                            elevation: 5,
                          )),
                      ButtonTheme(
                          minWidth: 250,
                          child: RaisedButton(
                            onPressed: () {
                              QuizList.quizList[index].inputAnswer(3);
                              setState(() {});
                            },
                            child: Text(
                              quiz.choice3String,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.blueAccent,
                            elevation: 5,
                          )),
                      ButtonTheme(
                          minWidth: 250,
                          child: RaisedButton(
                            onPressed: () {
                              QuizList.quizList[index].inputAnswer(4);
                              setState(() {});
                            },
                            child: Text(
                              quiz.choice4String,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.blueAccent,
                            elevation: 5,
                          )),
                      if (QuizList.quizList[index].userAnswerNum == 0)
                        Text(
                          '未回答',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        )
                      else if (QuizList.quizList[index].IsCorrectAnswer())
                        Text(
                          '正解！',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                        )
                      else
                        Text(
                          '不正解',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      if (QuizList.quizList[index].userAnswerNum != 0)
                        Card(child:
                            Container(child: Text(QuizList.quizList[index].commentaryString
                              .replaceAll('\\n', '\n')),
                            padding: EdgeInsets.all(5),
                          )
                        )
                      else
                        Container(),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
