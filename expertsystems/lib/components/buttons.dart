import 'package:expertsystems/quiz/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../design_specs/constraints.dart';
import '../design_specs/fonts.dart';
import '../design_specs/styles.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  final Widget? buttonExtension;
  const CustomButton(
      this.text, this.color, this.onPressed, this.buttonExtension,
      {Key? key})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: Heights.Height65,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          style: AppStyles.setButtonStandardStyle(widget.color)),
    );
  }
}

class QuizButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const QuizButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.put(QuizController());
    return Container(
      margin: EdgeInsets.only(
          left: AppMargins.margin10,
          right: AppMargins.margin10,
          top: AppMargins.margin20),
      width: MediaQuery.of(context).size.width,
      height: Heights.Height65,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w500,
                color: quizController.isPressedButton.value
                    ? Colors.black
                    : Colors.white),
          ),
          style: AppStyles.setButtonStandardStyle(
              quizController.buttonColors[quizController.questionIndex.value])),
    );
  }
}
