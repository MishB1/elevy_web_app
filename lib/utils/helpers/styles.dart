import 'package:flutter/material.dart';


ButtonStyle borderedButtonStyle = ButtonStyle(
  elevation: const WidgetStatePropertyAll(0),
  backgroundColor: const WidgetStatePropertyAll(Colors.white),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    side: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  )),
);