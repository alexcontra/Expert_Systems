import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxInt questionIndex = 0.obs;
  RxBool isPressedButton = false.obs;
  RxInt questionSelectedIndex = 0.obs;
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
