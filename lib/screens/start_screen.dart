import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/gradient_container.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.switchScreen, super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      startColor: Colors.deepPurple.shade800,
      endColor: Colors.deepPurple.shade500,
      children: _ColumnStartScreen(
        switchScreen: switchScreen,
      ),
    );
  }
}

class _ColumnStartScreen extends StatelessWidget {
  const _ColumnStartScreen({required this.switchScreen});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(155, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.9,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter',
            style: GoogleFonts.robotoMono(
              color: const Color.fromARGB(200, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(250, 255, 255, 255),
            ),
            icon: const Icon(Icons.app_registration_sharp),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.titilliumWeb(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
