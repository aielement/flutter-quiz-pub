import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz{
  String questionString;
  String choice1String;
  String choice2String;
  String choice3String;
  String choice4String;
  String commentaryString;
  int correctAnswerNum;
  int userAnswerNum;

  Quiz(QueryDocumentSnapshot queryDocumentSnapshot){
    var data = queryDocumentSnapshot.data();
    questionString = data['question'];
    choice1String = data['choice1'];
    choice2String = data['choice2'];
    choice3String = data['choice3'];
    choice4String = data['choice4'];
    correctAnswerNum = data['answer'];
    userAnswerNum = 0;
    commentaryString = data['commentary'];
  }

  void inputAnswer(int answerNum){
    userAnswerNum = answerNum;
  }

  bool IsCorrectAnswer(){
    return correctAnswerNum == userAnswerNum;
  }
}

class QuizList{
  static List<Quiz> quizList = List<Quiz>();

  static void PrepareQuizList(String quizEventDocumentId) async {
    quizList.clear();
    CollectionReference ref = FirebaseFirestore.instance
        .collection('quiz-test')
        .doc(quizEventDocumentId)
        .collection('quiz_1');

    var querySnapshot = await ref.get();

    querySnapshot.docs.forEach((element) {
      quizList.add(Quiz(element));
    });

  }
}