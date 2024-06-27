import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectAnswer,required this.restartQuiz});

  final List<String> selectAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummery() {
    final List<Map<String, Object>> summery = [];

    for (int i = 0; i < selectAnswer.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectAnswer[i]
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummery();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answerd $numCorrectQuestion out of $numTotalQuestion question correcatly!!',
              style: const TextStyle(
                color: Color.fromARGB(255, 188, 184, 184),
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
