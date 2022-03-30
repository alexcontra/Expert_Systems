import 'package:expertsystems/components/buttons.dart';
import 'package:expertsystems/models/answer_model.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerPage extends StatefulWidget {
  final List<String> listOfAnswers;
  const AnswerPage({required this.listOfAnswers, Key? key}) : super(key: key);

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final QuizController quizController = Get.put(QuizController());
  // late List<Color> buttonColors;
  // @override
  // void initState() {
  //   for (int i = 0; i < widget.listOfAnswers.length; i++) {
  //     buttonColors[i] = Colors.grey[400]!;
  //   }
  //   super.initState();
  // }
  List<AnswerModel> answers = [];
  @override
  void initState() {
    for (int i = 0; i < widget.listOfAnswers.length; i++) {
      AnswerModel newAnswer = AnswerModel(widget.listOfAnswers[i]);
      answers.add(newAnswer);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(children: [
        for (int i = 0; i < answers.length; i++)
          QuizButton(
              backgroundColor: answers[i].backgroundColor!,
              textColor: answers[i].textColor!,
              text: answers[i].answer!,
              index: i,
              onPressed: () {
                if (quizController.questionSelectedIndex.value != 100) {
                  quizController.disableButton(100);
                  answers[i].backgroundColor == Colors.blue[400];
                } else {
                  answers[i].backgroundColor == Colors.blue[400];
                }
                setState(() {});
              })
      ])),
    );
  }
}
