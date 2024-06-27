import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final isCorrect=data['correct_answer']== data['user_answer'];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration:   BoxDecoration(
                      color: isCorrect? const Color.fromARGB(255, 107, 143, 233):const Color.fromARGB(255, 227, 103, 218),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (data['question'] as String),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          (data['correct_answer'] as String),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 207, 180, 253),
                          ),
                        ),
                        Text(
                          (data['user_answer'] as String),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 137, 191, 234),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
