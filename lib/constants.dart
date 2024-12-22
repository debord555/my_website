import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final String introText =
    "Hi there! I'm a Computer Science and Engineering student from Assam, India, with a deep passion for developing Flutter apps. Along with my love for Flutter development, I am also very interested in the exciting field of Computer Graphics. \n\nI'm always eager to learn, grow, and explore new opportunities where I can apply my skills and knowledge. I'm currently looking for learning and work opportunities where I can contribute and further develop my expertise. Feel free to take a look at my CV — I would love to connect and collaborate!";

final List<Map<String, dynamic>> projects = [
  {
    "name": "Sonata Music Player",
    "description":
        "Sonata is a sleek and intuitive music player built with Flutter, designed to enhance your music listening experience with powerful features and a user-friendly interface.",
    "trailing": OutlinedButton(
      child: Text("View Source"),
      onPressed: () {
        launchUrl(sonataSource);
      },
    ),
    "image": AssetImage("assets/images/sonata.png"),
  },
  {
    "name": "SuDoKu Game",
    "description":
        "This is a SuDoKu game and solver application created using Dart & Flutter.",
    "trailing": Row(
      children: [
        OutlinedButton(
          child: Text("View Source"),
          onPressed: () {
            launchUrl(sudokuSource);
          },
        ),
        SizedBox.square(dimension: 8,),
        OutlinedButton(
          child: Text("Play"),
          onPressed: () {
            launchUrl(sudokuHostedLink);
          },
        ),
      ],
    ),
    "image": AssetImage("assets/images/sudoku.png"),
  },
  {
    "name": "Portfolio Website",
    "description":
        "The website you are looking at! This too was made by me using Dart & Flutter.",
    "trailing": OutlinedButton(
      onPressed: () {
        launchUrl(sourceUri);
      },
      child: Text("View Source"),
    ),
    "image": AssetImage("assets/images/website.png"),
  }
];

final List<Map<String, dynamic>> myTimelineStuff = [
  {
    "date": "Today",
    "eventTitle": "Student at Tezpur University",
    "eventDescription":
        "Pursuing Bachelor of Technology in Computer Science & Engineering. Expected to graduate in 2026.",
    "icon": Icons.today,
    "color": Colors.black,
  },
  {
    "date": "November 2024",
    "eventTitle": "2nd Prize - HackXetra",
    "eventDescription":
        "Secured 2nd Prize at HackXetra, a hackathon conducted under TechXetra 2024, at Tezpur University.",
    "icon": Icons.emoji_events,
    "color": Colors.amberAccent,
    "iconColor": Colors.black,
  },
  {
    "date": "June 2022",
    "eventTitle": "Completed Higher Secondary Education",
    "eventDescription":
        "Completed Higher Secondary Education from Pragya Academy, Jorhat. Percentage scored: 94.2%",
    "icon": Icons.school,
    "color": Colors.green,
  },
  {
    "date": "November 2021",
    "eventTitle": "Received ARSM Diploma",
    "eventDescription":
        "Was awarded the diploma of Associate of the Royal Schools of Music, by ABRSM, UK. ",
    "icon": Icons.school,
    "color": Colors.green,
  },
  {
    "date": "June 2020",
    "eventTitle": "Completed High School Education",
    "eventDescription":
        "Completed High School Education from Don Bosco H.S.S. Baghchung, Jorhat. Percentage scored: 95.2%",
    "icon": Icons.school,
    "color": Colors.green,
  },
  {
    "date": "February 2020",
    "eventTitle": "Best Student Award",
    "eventDescription":
        "Awarded by Don Bosco H.S.S. Baghchung, Jorhat",
    "icon": Icons.emoji_events,
    "color": Colors.amberAccent,
    "iconColor": Colors.black,
  },
  {
    "date": "December 2017",
    "eventTitle": "Best Overall Performance - Build-a-Thon",
    "eventDescription":
        "Build-a-Thon North Eastern Regional Level, organized by Robotech India Pvt. Ltd.",
    "icon": Icons.emoji_events,
    "color": Colors.amberAccent,
    "iconColor": Colors.black,
  },
];

final linkedInProfile =
    Uri.parse("https://linkedin.com/in/debasishbordoloi555");
final githubProfile = Uri.parse("https://github.com/debord555");
final cvLink = Uri.parse("https://bit.ly/debord_cv");
final sourceUri = Uri.parse("https://github.com/debord555/my_website");
final sonataSource = Uri.parse("https://github.com/debord555/sonata");
final sudokuSource = Uri.parse("https://github.com/debord555/sudoku");
final sudokuHostedLink = Uri.parse("https://debord555.github.io/sudoku");
