class QuizQuestion {
  const QuizQuestion({required this.question, required this.answer});

  final String question;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}
