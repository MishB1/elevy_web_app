import 'package:elevy_web_app/utils/helpers/colors.dart';
import 'package:flutter/material.dart';
import '../utils/helpers/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: w! / 5),
        child: Column(
          children: [
            Image.asset(
              mishbLabsLogo,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Mishb Labs!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'At MishB Labs, we are dedicated to creating innovative, practical, and accessible digital solutions that make everyday tasks simpler. We believe technology should not only be powerful, but also easy to understand and useful to the people who rely on it. Our mission is to build software that solves real-world problems while delivering a simple, reliable, and enjoyable experience for our users.',
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
              'MishB Labs was founded with a vision to explore the possibilities of technology and turn ideas into meaningful digital solutions. What started as a passion for software development has grown into a commitment to building applications that are useful, intuitive, and accessible. From simple tools to more ambitious digital products, we continue to learn, experiment, and improve with every project.',
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
              "Behind MishB Labs is a passionate and growing team of developers, designers, and technology enthusiasts who believe in the power of good ideas and thoughtful execution. We are committed to learning continuously, embracing new technologies, and creating solutions that can make a genuine difference in people's everyday lives.",          
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
