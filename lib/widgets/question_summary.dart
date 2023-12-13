import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/question_summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
    // required this.isCorrectAnswer,
  });

  final List<Map<String, Object>> summaryData;
  // final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => QuestionSummaryItem(itemData: data))
              .toList(),
        ),
      ),
    );
  }
}
