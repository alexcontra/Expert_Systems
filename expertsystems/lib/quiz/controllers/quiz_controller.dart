import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxInt questionIndex = 0.obs;
  RxBool isPressedButton = false.obs;
  RxInt questionSelectedIndex = 5.obs;
  RxList buttonColors = [
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400]
  ].obs;
  RxList buttonColorsText = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ].obs;
  enableButton(int index) {
    buttonColors[index] = Colors.blue[100];
    buttonColorsText[index] = Colors.black;
    questionSelectedIndex.value = index;
  }

  disableButton() {
    buttonColors[questionSelectedIndex.value] = Colors.grey[400];
    buttonColorsText[questionSelectedIndex.value] = Colors.white;
    questionSelectedIndex.value = 5;
  }
}
