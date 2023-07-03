import 'package:fase_dois/data/model/quiz_data.dart';

abstract interface class QuizRepository {
    Future<QuizData> getQuizInfo();
}