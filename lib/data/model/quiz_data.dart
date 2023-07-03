import 'package:fase_dois/data/model/categories.dart';

class QuizData {
  List<Categories> categories = [];

  QuizData({this.categories = const []});

  QuizData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories'] = categories.map((v) => v.toJson()).toList();
      return data;
  }
}