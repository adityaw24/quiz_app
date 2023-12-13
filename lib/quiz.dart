import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/widgets/gradient_container.dart';

const _startScreen = 'start-screen';
const _questionScreen = 'question-screen';
const _resultScreen = 'result-screen';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? _activeScreen;

  var _activeScreen = _startScreen;
  List<String> selectedAnswer = [];

  // @override
  // void initState() {
  //   _activeScreen = StartScreen(
  //     switchScreen: switchScreenHandler,
  //   );
  //   super.initState();
  // }

  void switchScreenHandler() {
    setState(() {
      // _activeScreen = const QuestionScreen();
      _activeScreen = _questionScreen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == question.length) {
      setState(() {
        // selectedAnswer = [];
        _activeScreen = _resultScreen;
      });
    }

    // log(selectedAnswer.toString());
  }

  void restartQuizHandler() {
    setState(() {
      selectedAnswer = [];
      _activeScreen = _startScreen;
    });
  }

  void prevQuestion() {
    if (selectedAnswer.isNotEmpty) {
      selectedAnswer.removeLast();
    } else {
      setState(() {
        _activeScreen = _startScreen;
      });
    }

    // log(selectedAnswer.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen: switchScreenHandler);

    switch (_activeScreen) {
      case _questionScreen:
        screenWidget = QuestionScreen(
          onSelectAnswer: chooseAnswer,
          onBackQuestion: prevQuestion,
        );
        break;
      case _resultScreen:
        screenWidget = ResultScreen(
          choosenAnswer: selectedAnswer,
          onRestart: restartQuizHandler,
        );
        break;
      default:
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
        body: GradientContainer(
          startColor: Colors.deepPurple.shade800,
          endColor: Colors.deepPurple.shade500,
          children: screenWidget,
        ),
      ),
    );
  }
}
