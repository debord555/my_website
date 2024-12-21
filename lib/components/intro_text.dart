import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            padding: const EdgeInsets.fromLTRB(32, 40, 32, 50),
            child: Column(
              children: [
                Text(
                  "About Me",
                  style: GoogleFonts.ebGaramond(
                    fontSize: 54,
                  ),
                ),
                SizedBox.square(
                  dimension: 32,
                ),
                Text(
                  introText,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
