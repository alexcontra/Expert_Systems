import 'package:flutter/material.dart';

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
  final int index;
  final Color backgroundColor;
  final Color textColor;
  final void Function()? onPressed;
  const QuizButton(
      {required this.text,
      required this.index,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: textColor), //quizController.buttonColorsText[index]
          ),
          style: AppStyles.setButtonStandardStyle(backgroundColor)),
    );
  }
}
