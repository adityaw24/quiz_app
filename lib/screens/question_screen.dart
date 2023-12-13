import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
    required this.onBackQuestion,
  });

  final void Function(String answer) onSelectAnswer;
  final void Function() onBackQuestion;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var _answerIndex = 0;

  void nextQuestion(String answer) {
    if (question.length > 1) {
      widget.onSelectAnswer(answer);
      setState(() {
        _answerIndex++;
      });
    }
  }

  void prevQuestion() {
    widget.onBackQuestion();
    if (_answerIndex > 0) {
      setState(() {
        _answerIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[_answerIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // AnswerButton(text: 'Answer', answerHandler: () {}),
            ...currentQuestion.getShuffledAnswers().map((e) {
              return AnswerButton(
                text: e,
                answerHandler: () {
                  nextQuestion(e);
                },
              );
            }),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: prevQuestion,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Back',
                style: GoogleFonts.roboto(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
