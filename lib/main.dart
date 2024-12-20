import 'package:flutter/material.dart';
import 'package:my_website/components/intro_text.dart';
import 'package:my_website/components/sambodhan.dart';
import 'package:my_website/constants.dart';

void main() {
  runApp(const Website());
}

class Website extends StatelessWidget {
  const Website({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Debasish Bordoloi",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Debasish Bordoloi"),
          actions: [
            OutlinedButton(
              onPressed: () {},
              child: Text("View CV"),
            ),
            SizedBox.square(
              dimension: 16,
            )
          ],
        ),
        body: ListView(
          children: [
            Sambodhan(),
            IntroText(),
            Container(
              height: 400,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
