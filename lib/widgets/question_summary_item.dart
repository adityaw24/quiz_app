import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/question_identifier.dart';

class QuestionSummaryItem extends StatelessWidget {
  const QuestionSummaryItem({
    super.key,
    required this.itemData,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'].toString(),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  itemData['user_answer'].toString(),
                  style: GoogleFonts.roboto(
                    color:
                        isCorrectAnswer ? Colors.blueAccent : Colors.redAccent,
                  ),
                ),
                // Text(
                //   itemData['correct_answer'].toString(),
                //   style: GoogleFonts.roboto(
                //     color: Colors.blueAccent,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
