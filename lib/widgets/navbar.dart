import 'package:elevy_web_app/utils/colors.dart';
import 'package:elevy_web_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../utils/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return  ScreenTypeLayout.builder(
     // mobile: (BuildContext context) => mobileNavBar(),
      desktop: (BuildContext context) => desktopNavBar(),
      //tablet: (BuildContext context) => tabletNavBar(),
    );
  }

  /*Widget mobileNavBar() {

  }

  Widget tabletNavBar() {
    
  }*/

  Widget desktopNavBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navLogo(),
          Row(
            children: [
              navButton('Charges Calculator'),
              navButton('Currency Converter')
            ],
          ),
        SizedBox(
          height:  50,
          child: ElevatedButton(
            style: borderedButtonStyle,
            onPressed: () {},
            child: Text('About Us', style: TextStyle(color: AppColors.primary),)
          ),
        ) 
        ],
      ),
    );
  }

  Widget navLogo() {
    return Container(
      width: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(logo))
      ),
    );
  }

  Widget navButton(String text){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {},
        child: Text(text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        )
      ),
    );
  }
}