class QAmodel {
  String questions;
  String answers;

  QAmodel({ required this.questions,  required this.answers});

  factory QAmodel.fromJson(dynamic json) {
    return QAmodel(
      questions: "${json['questions']}",
      answers: "${json['faq_answers']}",
    );
  }

  Map toJson() => {
        "questions": questions,
        "faq_answers": answers,
      };
}