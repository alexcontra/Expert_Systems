import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../design_specs/assets.dart';
import '../design_specs/constraints.dart';
import 'buttons.dart';

class StandardCircularButton extends StatelessWidget {
  final void Function()? onPressed;
  const StandardCircularButton({required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Heights.Height100,
      child: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppMargins.margin32),
              child: const SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.only(right: AppMargins.margin32),
              child: ElevatedButton(
                onPressed: onPressed,
                child: Center(child: SvgPicture.asset(Assets.rightArrowSvg)),
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: Colors.grey[700],
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(AppMargins.margin20),
                  primary: Colors.grey[700],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StandardBottomNavigation extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const StandardBottomNavigation(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: BottomAppBar(
            elevation: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    text, Colors.grey[800]!, onPressed, const SizedBox()),
              ],
            )));
  }
}
