import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Sambodhan extends StatefulWidget {
  const Sambodhan({super.key});

  @override
  State<Sambodhan> createState() => _SambodhanState();
}

class _SambodhanState extends State<Sambodhan> {
  late VideoPlayerController diamondVideoController;
  late Future<void> waitForInitialize;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller
    diamondVideoController =
        VideoPlayerController.asset("assets/videos/diamonds.mp4");

    // Initialize the controller asynchronously
    waitForInitialize = diamondVideoController.initialize().then((_) {
      // Ensure the state is updated after initialization
      setState(() {});
      diamondVideoController.setLooping(true);
      diamondVideoController.play();
    });
  }

  @override
  void dispose() {
    diamondVideoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: waitForInitialize,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRect(
            // Clip the video if necessary
            child: Container(
              height: screenHeight,
              width: screenWidth,
              child: FittedBox(
                fit: BoxFit.cover, // Fit and clip the video as needed
                child: SizedBox(
                  width: diamondVideoController.value.size.width,
                  height: diamondVideoController.value.size.height,
                  child: VideoPlayer(diamondVideoController),
                ),
              ),
            ),
          );
        } else {
          return Container(
            height: screenHeight,
            width: screenWidth,
          );
        }
      },
    );
  }
}
