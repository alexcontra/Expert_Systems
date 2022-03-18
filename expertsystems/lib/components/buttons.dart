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