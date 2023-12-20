import 'package:elevy_web_app/utils/helpers/colors.dart';
import 'package:flutter/material.dart';
import '../utils/helpers/constants.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: const BackButton(color: Colors.white,),
        title: const Text(
          'About Us', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: w!/5),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png', // Replace with the path to your company logo
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Xpense',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'At our Company, we are dedicated to providing innovative solutions for our customers. Our mission is to...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Story',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your Company was founded in [year] with a vision to [briefly explain the motivation behind starting the company]. Since then, we have...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Meet the Team',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Get to know the passionate individuals behind Your Company who work tirelessly to...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
