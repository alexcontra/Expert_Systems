import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:get/get.dart';

QuizController quizController = Get.put(QuizController());

saveAnswer(String answer) => quizController.finalAnswers.add(answer);

deleteAnswer(String answer) => quizController.finalAnswers.remove(answer);
