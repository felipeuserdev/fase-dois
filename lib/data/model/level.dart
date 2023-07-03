import 'package:fase_dois/data/model/question.dart';

class Level {
  String icon = "";
  List<Questions> questions = [];

  Level({this.icon = "", this.questions = const []});

  Level.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['questions'] = questions.map((v) => v.toJson()).toList();
      return data;
  }
}