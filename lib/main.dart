import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/components/connections.dart';
import 'package:my_website/components/frosted_appbar.dart';
import 'package:my_website/components/intro_text.dart';
import 'package:my_website/components/project_viewer.dart';
import 'package:my_website/components/sambodhan.dart';
import 'package:my_website/components/timeline.dart';

void main() {
  runApp(const Website());
}

class Website extends StatelessWidget {
  const Website({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Debasish Bordoloi",
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Debasish Bordoloi"),
        //   actions: [
        //     OutlinedButton(
        //       onPressed: () {},
        //       child: Text("View CV"),
        //     ),
        //     SizedBox.square(
        //       dimension: 16,
        //     )
        //   ],
        // ),
        body: Stack(
          children: [
            ListView(
              children: [
                Sambodhan(),
                IntroText(),
                ProjectViewer(),
                TimeLine(),
                Connections(),
              ],
            ),
            FrostedAppbar(),
          ],
        ),
      ),
    );
  }
}
