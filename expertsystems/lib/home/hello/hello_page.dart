import 'package:expertsystems/design_specs/constraints.dart';
import 'package:expertsystems/design_specs/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../design_specs/assets.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: AppMargins.margin20, right: AppMargins.margin20),
              child: SvgPicture.asset(
                Assets.projectSVG,
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
              'Proiect Sisteme Expert',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
