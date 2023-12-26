import 'package:elevy_web_app/pages/containers/desktopContainer.dart';
import 'package:elevy_web_app/utils/helpers/colors.dart';
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
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [NavBar(), DesktopContainer(), ],
            ),
          ),
        ),
      ),
    );
  }
}
