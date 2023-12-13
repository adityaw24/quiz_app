import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    final Color isAnswer;

    switch (isCorrectAnswer) {
      case true:
        isAnswer = Colors.blueAccent;
        break;
      default:
        isAnswer = Colors.redAccent;
        break;
    }

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isAnswer,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
