import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/constants.dart';

class ProjectViewer extends StatelessWidget {
  const ProjectViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.fromLTRB(
        screenWidth < 500 ? 8 : 32,
        32,
        screenWidth < 500 ? 8 : 32,
        32,
      ),
      child: Column(
        children: [
          Text(
            "My Projects",
            style: GoogleFonts.ebGaramond(
              fontSize: 54,
              color: Colors.white,
            ),
          ),
          SizedBox.square(
            dimension: 32,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: max(1, (screenWidth / 450).floor()),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: screenWidth < 500 ? 4 / 5 : 1,
            children: [
              for (int i = 0; i < projects.length; i++)
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image(
                            image: projects[i]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: screenWidth < 500 ? 3 : 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox.square(dimension: 16),
                                  Text(
                                    projects[i]["name"],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox.square(dimension: 8),
                                  Text(
                                    projects[i]["description"],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  projects[i]["trailing"],
                                  SizedBox.square(
                                    dimension: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
          SizedBox.square(
            dimension: 32,
          )
        ],
      ),
    );
  }
}
