class Questions {
  String tip = "";
  int order = -1;
  String question = "";
  int correctAnswer = -1;
  List<String> response = [];
  List<String> answers = [];

  Questions(
      {this.tip = "",
        this.order = -1,
        this.question = "",
        this.correctAnswer = -1,
        this.response = const [],
        this.answers = const []});

  Questions.fromJson(Map<String, dynamic> json) {
    tip = json['tip'];
    order = json['order'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    response = json['response'] == null? [] : List<String>.from(json["response"].map((x) => x));
    answers = json['answers'] == null? [] : List<String>.from(json["answers"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tip'] = tip;
    data['order'] = order;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['response'] = response;
    data['answers'] = answers;
    return data;
  }
}