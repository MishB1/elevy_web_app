import 'package:elevy_web_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Container1 extends StatefulWidget {
  const Container1({super.key});

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  @override
  Widget build(BuildContext context) {
   return ScreenTypeLayout.builder(
     desktop: (BuildContext context) => desktopContainer1(),
    );
  }

  Widget desktopContainer1() {
    return Container(
      margin: const EdgeInsets.all(35),
      width: w!/1.5,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
    );
  }
}