import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/constants.dart';
import 'package:my_website/misc/website_custom_icons_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Connections extends StatelessWidget {
  const Connections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 32),
      child: Column(
        children: [
          Text(
            "Let's Connect!",
            style: GoogleFonts.ebGaramond(
              fontSize: 54,
              color: Colors.white,
            ),
          ),
          SizedBox.square(
            dimension: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  launchUrl(cvLink);
                },
                child: Text(
                  "View CV",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 16,
              ),
              IconButton(
                icon: Icon(WebsiteCustomIcons.github_square),
                onPressed: () {
                  launchUrl(githubProfile);
                },
                color: Colors.white,
              ),
              SizedBox.square(
                dimension: 16,
              ),
              IconButton(
                icon: Icon(WebsiteCustomIcons.linkedin),
                onPressed: () {
                  launchUrl(linkedInProfile);
                },
                color: Colors.white,
              ),
              // SizedBox.square(
              //   dimension: 16,
              // ),
              // IconButton(
              //   icon: Icon(WebsiteCustomIcons.discord),
              //   onPressed: () {},
              //   color: Colors.white,
              // ),
            ],
          ),
          SizedBox.square(
            dimension: 32,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "This website was created using Flutter. View the source code ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: "here",
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    launchUrl(sourceUri);
                  },
                ),
                TextSpan(
                  text: ".",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
