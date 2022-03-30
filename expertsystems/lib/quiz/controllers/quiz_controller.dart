import 'package:get/get.dart';

class QuizController extends GetxController {
  RxInt questionIndex = 0.obs;
  RxBool isPressedButton = false.obs;
  RxInt questionSelectedIndex = 0.obs;
  RxInt slectedAnswerIndex = 0.obs;
  RxString currentAnswer = ''.obs;
}
