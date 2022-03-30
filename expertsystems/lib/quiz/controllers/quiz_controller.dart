import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxInt questionIndex = 0.obs;
  RxBool isPressedButton = false.obs;
  RxInt questionSelectedIndex = 0.obs;
  RxInt slectedAnswerIndex = 0.obs;
  late RxList buttonColors;
  late RxList buttonColorsText;

  initLists(int numberOfAnswers) {
    for (int i = 0; i < numberOfAnswers; i++) {
      buttonColors[i] = Colors.grey[400];
      buttonColorsText[i] = Colors.white;
    }
  }

  enableButton(int index) {
    buttonColors[index] = Colors.blue[100];
    buttonColorsText[index] = Colors.black;
    questionSelectedIndex.value = index;
  }

  disableButton(int index) {
    buttonColors[questionSelectedIndex.value] = Colors.grey[400];
    buttonColorsText[questionSelectedIndex.value] = Colors.white;
    questionSelectedIndex.value = index;
  }

  resetValues() {
    questionIndex.value = 0;
    questionSelectedIndex.value = 0;
    buttonColors = [
      Colors.grey[400],
      Colors.grey[400],
      Colors.grey[400],
      Colors.grey[400]
    ].obs;
    buttonColorsText = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ].obs;
  }
}
