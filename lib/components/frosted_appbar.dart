import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class FrostedAppbar extends StatelessWidget {
  const FrostedAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            width: screenWidth,
            height: 80,
            color: Colors.black.withValues(alpha: 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox.square(
                      dimension: 32,
                    ),
                    Text(
                      "Debasish Bordoloi",
                      style: GoogleFonts.birthstone(
                          color: Colors.white, fontSize: 54),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(cvLink);
                      },
                      child: Text(
                        "View CV",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 16,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
