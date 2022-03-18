import 'package:expertsystems/components/bottom_navigation.dart';
import 'package:expertsystems/design_specs/constraints.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../design_specs/assets.dart';
import '../../design_specs/fonts.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 15,
        leading: Obx(() => quizController.questionIndex.value == 0
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  quizController.questionIndex.value--;
                },
                icon: const Icon(Icons.arrow_back_ios))),
        title: const Text(
          'Chestionar',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: AppMargins.margin20,
                left: AppMargins.margin20,
                right: AppMargins.margin20),
            child: Row(
              children: [
                Text(
                  '${quizController.questionIndex.value}/10',
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Sizes.size20),
                ),
                const Spacer(),
                SvgPicture.asset(
                  Assets.questionSVG,
                  width: Heights.Height100,
                  height: Heights.Height100,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppMargins.margin20,
                left: AppMargins.margin20,
                right: AppMargins.margin20),
            child: Text(
              'Let me know if you have any question here about food????',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: Sizes.size20),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          StandardBottomNavigation(text: 'Mai departe', onPressed: () {}),
    );
  }
}
