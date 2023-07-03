import 'dart:convert';
import 'package:fase_dois/data/model/quiz_data.dart';
import 'package:fase_dois/domain/repository/quiz_repository.dart';
import 'package:flutter/services.dart';

class QuizRepositoryImpl implements QuizRepository {
  @override
  Future<QuizData> getQuizInfo() async {
    String localJson = await rootBundle.loadString('assets/json/quiz_data.json');
    var data = await json.decode(localJson) as Map<String, dynamic>;
    return QuizData.fromJson(data);
  }
}