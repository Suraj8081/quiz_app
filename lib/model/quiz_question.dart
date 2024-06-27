class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getSuffledAnswer() {
    final sufflelist = List.of(answers);
    sufflelist.shuffle();
    return sufflelist;
  }
}
