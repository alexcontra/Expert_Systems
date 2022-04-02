import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget customCircularProgressIndicator(BuildContext context, double margin) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: margin),
      child: Transform.scale(
        scale: 0.2,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [
            Colors.purple,
            Colors.blue,
          ],
        ),
      ),
    ),
  );
}
