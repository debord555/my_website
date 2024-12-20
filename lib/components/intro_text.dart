import 'package:flutter/material.dart';
import 'package:my_website/constants.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Center(
        child: SizedBox(
          width: 1000,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 32),
            child: Text(
              introText,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
