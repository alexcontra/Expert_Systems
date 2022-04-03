import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:expertsystems/service/responses/question/question.dart';
import 'package:get/get.dart';

QuizController quizController = Get.put(QuizController());
getRecipies(List<Question> questionsQuery) {
  for (var ourAnswer in quizController.finalAnswers) {
    for (int i = 0; i < questionsQuery.length; i++) {
      for (var answer in questionsQuery[i].answers!) {
        if (ourAnswer == answer.title) {
          quizController.finalRecipes =
              quizController.finalRecipes + answer.recipes!;
        }
      }
    }
  }
}
