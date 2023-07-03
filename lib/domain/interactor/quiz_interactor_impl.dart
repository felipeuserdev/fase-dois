import 'package:fase_dois/data/model/quiz_data.dart';
import 'package:fase_dois/domain/interactor/quiz_interactor.dart';
import 'package:fase_dois/domain/repository/quiz_repository.dart';

class QuizInteractorImpl implements QuizInteractor {
  QuizRepository repository;

  QuizInteractorImpl({required this.repository});

  @override
  Future<QuizData> getQuizInfo() {
    return repository.getQuizInfo();
  }
}
