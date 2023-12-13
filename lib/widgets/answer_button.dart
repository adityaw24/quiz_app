import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.text,
    required this.answerHandler,
    super.key,
  });

  final String text;
  final void Function() answerHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
        onPressed: answerHandler,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
              vertical: 12,
            ),
            backgroundColor: const Color.fromARGB(255, 2, 9, 104),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(),
        ),
      ),
    );
  }
}
