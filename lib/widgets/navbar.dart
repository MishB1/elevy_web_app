import 'package:elevy_web_app/pages/about.dart';
import 'package:elevy_web_app/utils/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../utils/helpers/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
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
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navLogo(),
          Row(
            children: [
              networkLogosContainer(['momo.png', 'vodaCash.png', 'airteltigo.png']),
              //navButton('Charges Calculator'),
             // navButton('Currency Converter')
            ],
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: borderedButtonStyle,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutPage()));
                },
                child: const Text(
                  'About Us',
                  style: TextStyle(color: Colors.black87),
                )),
          )
        ],
      ),
    );
  }

  Widget navLogo() {
    return Container(
      width: 100,
      decoration:
          const BoxDecoration(image: DecorationImage(image: AssetImage(logo))),
    );
  }

  Widget networkLogosContainer(List<String> logoPaths) {
  return Row(
    children: logoPaths.map((path) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$path'),
            ),
          ),
        ),
      );
    }).toList(),
  );
}


  Widget navButton(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
