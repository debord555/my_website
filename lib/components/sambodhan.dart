import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/components/scroll_indicator.dart';
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

    diamondVideoController =
        VideoPlayerController.asset("assets/videos/diamonds.mp4");
    waitForInitialize = diamondVideoController
        .initialize()
        .then((_) => diamondVideoController.setLooping(true));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
      diamondVideoController.setVolume(0); 
      // Plays the video once the widget is build and loaded.
      diamondVideoController.play();
    });
  }

  Future<int> initializeVideo() async {
    await diamondVideoController.initialize();
    await diamondVideoController.setLooping(true);
    await diamondVideoController.play();
    return 0;
  }

  @override
  void dispose() {
    diamondVideoController.dispose();
    //print("Video controller disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = 0;

    return Stack(
      children: [
        FutureBuilder(
          future: waitForInitialize,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              //print("Building video player");
              
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
              return SizedBox(
                height: screenHeight - appBarHeight,
                width: screenWidth,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
        ScrollIndicator(
          screenHeight: screenHeight,
          appBarHeight: 0,
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: SizedBox(
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
                    style: GoogleFonts.ebGaramond(
                      fontSize: 54,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "Debasish Bordoloi",
                    style: GoogleFonts.birthstone(
                      fontWeight: FontWeight.bold,
                      fontSize: 154,
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
