import 'package:expertsystems/home/home_page/home_page.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/bottom_navigation.dart';
import '../../design_specs/assets.dart';
import '../../design_specs/constraints.dart';
import '../../design_specs/fonts.dart';

class EndQuiz extends StatefulWidget {
  const EndQuiz({Key? key}) : super(key: key);

  @override
  State<EndQuiz> createState() => _EndQuizState();
}

class _EndQuizState extends State<EndQuiz> {
  QuizController quizController = Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Column(
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
                      Assets.eatingSVG,
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
                    'Felicitari, ai terminat chestionarul',
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
                    'In urma evaluarii raspunsurilor tale,aceste retete ti se potrivesc cel mai bine: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.size20,
                    ),
                  ),
                ),
                for (var element in quizController.finalRecipes)
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppMargins.margin10,
                        left: AppMargins.margin20,
                        right: AppMargins.margin20),
                    child: Text(
                      element,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: StandardBottomNavigation(
            text: 'Iesire',
            onPressed: () {
              Get.to(() => const HomePage());
            }));
  }
}
