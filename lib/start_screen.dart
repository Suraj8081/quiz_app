import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(height: 30),
          Text(
            'Learn Flutter in fun Way',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: changeScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
