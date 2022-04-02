import 'package:expertsystems/components/bottom_navigation.dart';
import 'package:expertsystems/components/circular_indicator.dart';
import 'package:expertsystems/design_specs/constraints.dart';
import 'package:expertsystems/quiz/answer/answer_page.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:expertsystems/quiz/end_quiz/end_quiz.dart';
import 'package:expertsystems/service/responses/question/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../design_specs/assets.dart';
import '../../design_specs/fonts.dart';

class QuizPage extends StatefulWidget {
  final List<Question> question;
  const QuizPage({required this.question, Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizController quizController = Get.put(QuizController());

  @override
  void initState() {
    // quizController.initLists(20);
    super.initState();
  }

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
                  setState(() {});
                },
                icon: const Icon(Icons.arrow_back_ios))),
        title: const Text(
          'Chestionar',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: quizController.isLoading.value
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppMargins.margin20,
                      left: AppMargins.margin20,
                      right: AppMargins.margin20),
                  child: Row(
                    children: [
                      Obx(() => Text(
                            '${quizController.questionIndex.value + 1}/${widget.question.length}',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Sizes.size20),
                          )),
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
                  child: Obx(
                    () => Text(
                      "questions[quizController.questionIndex.value].title!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black, fontSize: Sizes.size20),
                    ),
                  ),
                ),
                Obx(() => AnswerPage(
                    listOfAnswers: widget
                        .question[quizController.questionIndex.value]
                        .answers!)),
              ],
            )
          : customCircularProgressIndicator(context, 10),
      bottomNavigationBar: Obx(() => StandardBottomNavigation(
          text: quizController.questionIndex.value == widget.question.length - 1
              ? 'Inchide'
              : 'Mai departe',
          onPressed: () {
            if (quizController.questionIndex.value <
                widget.question.length - 1) {
              quizController.questionIndex.value++;
            } else {
              quizController.questionIndex.value = 0;
              Get.to(() => const EndQuiz());
            }
            setState(() {});
          })),
    );
  }
}
