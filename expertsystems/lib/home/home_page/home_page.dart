import 'package:expertsystems/components/bottom_navigation.dart';
import 'package:expertsystems/components/circular_indicator.dart';
import 'package:expertsystems/design_specs/constraints.dart';
import 'package:expertsystems/network/api_service/quiz_api_service.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:expertsystems/quiz/quiz_page/quiz.dart';
import 'package:expertsystems/service/responses/question/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../design_specs/assets.dart';
import '../../design_specs/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Obx(() => quizController.isLoading.value
            ? customCircularProgressIndicator(context, 10)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: AppMargins.margin20,
                          right: AppMargins.margin20,
                          top: AppMargins.margin20),
                      child: SvgPicture.asset(
                        Assets.foodSVG,
                        width: Heights.Height200,
                        height: Heights.Height200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppMargins.margin20,
                        left: AppMargins.margin20,
                        right: AppMargins.margin20),
                    child: Text(
                      'Esti mereu indecis ce sa mananci?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                        fontSize: Sizes.size30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppMargins.margin20,
                        left: AppMargins.margin20,
                        right: AppMargins.margin20),
                    child: Text(
                      'Noi avem solutia. Vezi ce mancare ti se potriveste.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ),
                ],
              )),
        bottomNavigationBar: StandardBottomNavigation(
            text: 'Incepe chestionar',
            onPressed: () async {
              List<Question> questions = await QuizService().questionService();
              if (!quizController.isLoading.value) {
                Get.to(() => QuizPage(question: questions));
              }
            }));
  }
}
