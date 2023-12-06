import 'package:flutter/material.dart';


ButtonStyle borderedButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0),
  backgroundColor: const MaterialStatePropertyAll(Colors.white),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    side:  const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(50)
  ))
);