import 'package:dio/dio.dart';
import 'package:expertsystems/network/API/quiz_api/quiz_api.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:expertsystems/service/responses/question/question.dart';
import 'package:get/get.dart';

class QuizService {
  Future<List<Question>> questionService() async {
    final Dio dio = Dio();
    final client = QuestionRest(dio);
    QuizController quizController = Get.put(QuizController());
    List<Question> retValue = [];
    quizController.isLoading.value = true;
    try {
      retValue = await client.queryQuestion();
    } on DioError {
      Get.snackbar('Error', 'Something went wrong!');
    } finally {
      quizController.isLoading.value = false;
    }
    return retValue;
  }
}
