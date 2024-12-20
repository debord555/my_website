import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_website/components/scroll_indicator.dart';
import 'package:video_player/video_player.dart';

class Sambodhan extends StatefulWidget {
  const Sambodhan({super.key});

  @override
  State<Sambodhan> createState() => _SambodhanState();
}

class _SambodhanState extends State<Sambodhan> {
  late VideoPlayerController diamondVideoController;
  late Future<int> waitForInitialize;

  @override
  void initState() {
    super.initState();

    waitForInitialize = initializeVideo();
  }

  Future<int> initializeVideo() async {
    diamondVideoController =
        VideoPlayerController.asset("assets/videos/diamonds.mp4");
    await diamondVideoController.initialize();
    await diamondVideoController.setLooping(true);
    await diamondVideoController.play();
    return 0;
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
    final double appBarHeight = AppBar().preferredSize.height;

    return Stack(
      children: [
        FutureBuilder(
          future: waitForInitialize,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ClipRect(
                // Clip the video if necessary
                child: Container(
                  height: screenHeight - appBarHeight,
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
                height: screenHeight - appBarHeight,
                width: screenWidth,
              );
            }
          },
        ),
        ScrollIndicator(
          screenHeight: screenHeight,
          appBarHeight: appBarHeight,
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            width: screenWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Hi! I am",
                    style: TextStyle(
                      fontSize: 72,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "Debasish Bordoloi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 108,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
