import 'package:expertsystems/components/bottom_navigation.dart';
import 'package:expertsystems/design_specs/constraints.dart';
import 'package:expertsystems/quiz/answer/answer_page.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:expertsystems/quiz/end_quiz/end_quiz.dart';
import 'package:expertsystems/service/responses/question.dart';
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
  List<Question> questions = [
    Question(question: 'Ce mananci de obicei la micul dejun?', answers: [
      'Oua ochiuri',
      'Omleta',
      'Paine cu gem',
      'Altceva',
      'Oua ochiuri',
      'Omleta',
      'Paine cu gem',
      'Altceva',
      'Oua ochiuri',
      'Omleta',
      'Paine cu gem',
      'Altceva',
    ]),
    Question(
        question: 'Ce mananci de obicei la pranz?',
        answers: ['Salta Cezar', 'Supa crema', 'Peste', 'Altceva']),
    Question(
        question: 'Ce mananci de obicei la cina?',
        answers: ['Friptura', 'Paste', 'Burger', 'Altceva']),
  ];
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
                  quizController.disableButton(100);
                  setState(() {});
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
                Obx(() => Text(
                      '${quizController.questionIndex.value + 1}/${questions.length}',
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: Sizes.size20),
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
                questions[quizController.questionIndex.value].question!,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: Sizes.size20),
              ),
            ),
          ),
          AnswerPage(
              listOfAnswers:
                  questions[quizController.questionIndex.value].answers!)
        ],
      ),
      bottomNavigationBar: Obx(() => StandardBottomNavigation(
          text: quizController.questionIndex.value == questions.length - 1
              ? 'Inchide'
              : 'Mai departe',
          onPressed: quizController.questionSelectedIndex.value == 100
              ? null
              : () {
                  if (quizController.questionIndex.value <
                      questions.length - 1) {
                    quizController.questionIndex.value++;
                    quizController
                        .disableButton(quizController.questionIndex.value);
                  } else {
                    Get.to(() => const EndQuiz());
                  }
                  setState(() {});
                })),
    );
  }
}
