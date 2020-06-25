import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
      {'questionText': 'What\'s your favorite color? ', 
      'answers': [
        {'text':'red', 'score': 5}, 
        {'text':'black', 'score': 10}, 
        {'text':'white', 'score': 1}, 
        {'text':'gray', 'score': 3},
        ],
      },
      {'questionText': 'What\'s your favorite animal? ', 
       'answers': [
        {'text':'pig', 'score': 5}, 
        {'text':'cat', 'score': 10}, 
        {'text':'dog', 'score': 1}, 
        {'text':'bird', 'score': 3},
        ],
      },
      {'questionText': 'What\'s your favorite game? ', 
       'answers': [
        {'text':'cod', 'score': 5}, 
        {'text':'gtav', 'score': 10}, 
        {'text':'ml', 'score': 1}, 
        {'text':'lol', 'score': 3},
        ],
      },
    ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App'),),
      body: _questionIndex < _questions.length ? 
        Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions,)
       : Result(_totalScore, _resetQuiz),
    ),);
  }
}