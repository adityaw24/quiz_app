import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.choosenAnswer,
  });

  final void Function() onRestart;
  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': question[i].question,
          'correct_answer': question[i].answer[0],
          'user_answer': choosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = question.length;
    final numAnsweredCorrectly = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numAnsweredCorrectly out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(250, 255, 255, 255),
              ),
              icon: const Icon(Icons.restart_alt),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.titilliumWeb(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
