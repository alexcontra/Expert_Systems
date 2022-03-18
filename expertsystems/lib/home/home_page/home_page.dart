import 'package:expertsystems/components/buttons.dart';
import 'package:expertsystems/design_specs/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../design_specs/assets.dart';
import '../../design_specs/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
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
      ),
      bottomNavigationBar: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: BottomAppBar(
              elevation: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton('Incepe chestionar',
                      Colors.black.withOpacity(0.7), () {}, const SizedBox()),
                ],
              ))),
    );
  }
}
