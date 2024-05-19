import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevy_web_app/utils/helpers/constants.dart';
import 'package:flutter/material.dart';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({super.key});

  @override
  _FeedbackDialogState createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool feedbackSubmitted = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Set your desired dialog properties
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: w! / 2.2,
        height: h! / 1.7,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Feedback',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 5),
                // Add my icon
                feedbackSubmitted
                    ? Image.asset(successIcon, width: 100, height: 100)
                    : const SizedBox(), // Empty container if not showing icon
                const SizedBox(height: 20),
                Text(
                  feedbackSubmitted
                      ? 'We appreciate your feedback!'
                      : 'Did you like the app?',
                  style: feedbackSubmitted
                      ? const TextStyle(fontSize: 30, color: Colors.green)
                      : const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                feedbackSubmitted
                    ? const Text(
                        'Have a nice day.',
                        style: TextStyle(fontSize: 20),
                      )
                    : const SizedBox(), // Empty container if not showing icon

                feedbackSubmitted
                    ? Container()
                    : SizedBox(
                        width: w! / 2.33,
                        height: 120,
                        child: TextField(
                          controller: _commentController,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                            filled: true,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _commentController.clear();
                                },
                                icon: const Icon(Icons.clear)),
                            hintText: 'Any comments?',
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                feedbackSubmitted
                    ? Container()
                    : TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          suffixIcon: IconButton(
                              onPressed: () {
                                _emailController.clear();
                              },
                              icon: const Icon(Icons.clear)),
                          hintText: 'Enter your email',
                        ),
                      ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (!feedbackSubmitted) {
                          // Check if both comment and email are non-empty
                          if (_commentController.text.isEmpty ||
                              _emailController.text.isEmpty) {
                            setState(() {
                              errorMessage =
                                  'Please enter your comment and email';
                            });
                            return;
                          }

                          // If email is not empty, validate its format
                          if (!_isValidEmail(_emailController.text)) {
                            setState(() {
                              errorMessage = 'Please enter a valid email';
                            });
                            return;
                          }

                          // Store feedback in Firestore
                          try {
                            await FirebaseFirestore.instance
                                .collection('feedback')
                                .add({
                              'comment': _commentController.text,
                              'email': _emailController.text,
                              'timestamp': FieldValue.serverTimestamp(),
                            });

                            setState(() {
                              feedbackSubmitted = true;
                              errorMessage = '';
                            });

                            // Clear text controllers
                            _commentController.clear();
                            _emailController.clear();

                            // ignore: avoid_print
                            print('Submit button pressed');
                          } catch (e) {
                            setState(() {
                              errorMessage = 'Error submitting feedback: $e';
                            });
                            // ignore: avoid_print
                            print('Error submitting feedback: $e');
                          }
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(feedbackSubmitted ? 'Close' : 'Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    // Simple email validation
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegex.hasMatch(email);
  }
}
