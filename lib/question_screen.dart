import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
              color: Color.fromARGB(255, 189, 158, 243),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getSuffledAnswer().map((answer) {
            return AnswerButton(
              answerText: answer,
              onTap: () {
                answerQuestion(answer);
              },
            );
          }),
        ],
      ),
    );
  }
}
