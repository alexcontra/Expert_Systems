import 'package:expertsystems/components/buttons.dart';
import 'package:expertsystems/models/answer_model.dart';
import 'package:expertsystems/quiz/answer/business_logic/answer_page_view_model.dart';
import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:expertsystems/service/responses/answer/answer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerPage extends StatefulWidget {
  final List<Answer> listOfAnswers;
  const AnswerPage({required this.listOfAnswers, Key? key}) : super(key: key);

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  final QuizController quizController = Get.put(QuizController());

  List<AnswerModel> answers = [];
  @override
  void initState() {
    for (int i = 0; i < widget.listOfAnswers.length; i++) {
      AnswerModel newAnswer = AnswerModel(widget.listOfAnswers[i].title);
      answers.add(newAnswer);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnswerPage oldWidget) {
    if (oldWidget.listOfAnswers != widget.listOfAnswers) {
      answers = [];
      for (int i = 0; i < widget.listOfAnswers.length; i++) {
        AnswerModel newAnswer = AnswerModel(widget.listOfAnswers[i].title);
        answers.add(newAnswer);
      }
      quizController.currentAnswer.value = '';
      quizController.slectedAnswerIndex.value = 0;
    }
    super.didUpdateWidget(oldWidget);
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
                if (answers[i].backgroundColor == Colors.blue[400]) {
                  answers[i].backgroundColor = Colors.grey;
                  deleteAnswer(answers[i].answer!);
                } else {
                  answers[i].backgroundColor = Colors.blue[400];
                  quizController.currentAnswer.value = answers[i].answer!;
                  saveAnswer(answers[i].answer!);
                }
                setState(() {});
              })
      ])),
    );
  }
}
