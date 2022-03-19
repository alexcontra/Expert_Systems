import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  RxInt questionIndex = 0.obs;
  RxBool isPressedButton = false.obs;
  RxList buttonColors = [
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400]
  ].obs;
}
