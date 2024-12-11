class QuestionModel {
  final String question;
  final List<AnswerModel> answers;
  final String correctAnswer;
  bool isSelect;

  QuestionModel({
    required this.question,
    this.isSelect = false,
    required this.answers,
    required this.correctAnswer,
  });
}

class AnswerModel {
  final String answers;
  bool isSelect;

  AnswerModel({
    this.isSelect = false,
    required this.answers,
  });
}
