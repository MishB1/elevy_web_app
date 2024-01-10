import 'package:elevy_web_app/pages/containers/calculator_container.dart';
import 'package:elevy_web_app/utils/helpers/colors.dart';
import 'package:elevy_web_app/utils/helpers/styles.dart';
import 'package:elevy_web_app/widgets/feedback_dialog.dart';
import '../widgets/navBar.dart';
import 'package:flutter/material.dart';
import '../utils/helpers/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const NavBar(),
                const CalculatorContainer(),
                ElevatedButton(
                  style: borderedButtonStyle,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => const FeedbackDialog(),
                    );
                  },
                  child: const Text(
                    'Leave a comment!',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

