import '../../data/model/quiz_data.dart';

abstract interface class QuizInteractor {
  Future<QuizData> getQuizInfo();
}
