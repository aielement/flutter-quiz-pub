import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/quiz_event_page.dart';
import 'package:flutter_quiz/title_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await QuizDocument.loadQuizDocument();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  MyApp(){

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TitlePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _MyHomePageState(){

  }


  ListView _setQuizEventListView() {
    return ListView.builder(
      itemCount: QuizDocument.quizEventDocumentSnapshots.length,
      itemBuilder: (BuildContext itemBuildContext, int index) {
        var data = QuizDocument.quizEventDocumentSnapshots[index].data();
        return Card(
          child: Container(child:
          Column(children: [
            Text(
              data['title'],
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            RaisedButton(
              onPressed: () async{
                String documentId = QuizDocument.quizEventDocumentSnapshots[index].id;
                await QuizList.PrepareQuizList(documentId);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizEventPage(quizEventDocumentId: documentId);
                    },
                  ),
                );
              },
              child: Text('挑戦'),
              color: Colors.blueAccent,
              textColor: Colors.white,
            )
          ]),
            height: 100,
          ),

          elevation: 2,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference quizRef = FirebaseFirestore.instance.collection('quiz-test');
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: _setQuizEventListView(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class QuizDocument{
  static List<DocumentSnapshot> quizEventDocumentSnapshots = List<DocumentSnapshot>();

  static Future<List<DocumentSnapshot>> loadQuizDocument() async {
    CollectionReference quizRef = FirebaseFirestore.instance.collection('quiz-test');
    var querySnapShot = await quizRef.get();

    quizEventDocumentSnapshots = querySnapShot.docs;
  }
}
