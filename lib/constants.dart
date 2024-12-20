import 'package:flutter/material.dart';

final String introText = "Hi there! I'm a Computer Science and Engineering student from Assam, India, with a deep passion for developing Flutter apps. Along with my love for mobile development, I am also very interested in the exciting field of Computer Graphics. \n\nI'm always eager to learn, grow, and explore new opportunities where I can apply my skills and knowledge. I'm currently looking for learning and work opportunities where I can contribute and further develop my expertise. Feel free to take a look at my CV — I would love to connect and collaborate!";

final List<Map<String, dynamic>> projects = [
  {
    "name": "Sonata Music Player",
    "description": "Sonata is a sleek and intuitive music player built with Flutter, designed to enhance your music listening experience with powerful features and a user-friendly interface.",
    "trailing": OutlinedButton(child: Text("View"), onPressed: () {},),
    "image": AssetImage("assets/images/sonata.png"),
  },
  {
    "name": "SuDoKu Game",
    "description": "This is a SuDoKu game and solver application created using Dart & Flutter.",
    "trailing": OutlinedButton(child: Text("View"), onPressed: () {},),
    "image": AssetImage("assets/images/sudoku.png"),
  },
  {
    "name": "Portfolio Website",
    "description": "The website you are looking at! This too was made by me using Dart & Flutter.",
    "trailing": Container(),
    "image": AssetImage("assets/images/sudoku.png"),
  }
];