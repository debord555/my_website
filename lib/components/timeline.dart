import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/components/ordinary_timeline_tile.dart';
import 'package:my_website/constants.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.fromLTRB(
        (screenWidth < 500) ? 8 : 16,
        32,
        (screenWidth < 500) ? 8 : 16,
        32,
      ),
      color: Colors.grey.shade300,
      child: Column(
        children: [
          Text(
            "My Timeline",
            style: GoogleFonts.ebGaramond(
              fontSize: 54,
            ),
          ),
          Timeline.tileBuilder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            builder: TimelineTileBuilder(
              contentsAlign: ContentsAlign.basic,
              contentsBuilder: (context, index) {
                if (index % 2 == 0) {
                  return OrdinaryTimelineTile(
                    eventTitle: myTimelineStuff[index]["eventTitle"],
                    eventDescription: myTimelineStuff[index]
                        ["eventDescription"],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      myTimelineStuff[index]["date"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
              oppositeContentsBuilder: (context, index) {
                if (index % 2 != 0) {
                  return OrdinaryTimelineTile(
                    eventTitle: myTimelineStuff[index]["eventTitle"],
                    eventDescription: myTimelineStuff[index]
                        ["eventDescription"],
                    alignAtEnd: true,
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      myTimelineStuff[index]["date"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
              itemCount: myTimelineStuff.length,
              startConnectorBuilder: getStartConnector,
              endConnectorBuilder: getEndConnector,
              indicatorBuilder: (context, index) => ClipOval(
                child: Container(
                  height: 40,
                  width: 40,
                  color: myTimelineStuff[index]["color"] ?? Colors.deepPurple,
                  child: Icon(
                    myTimelineStuff[index]["icon"],
                    color: myTimelineStuff[index]["iconColor"] ?? Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getEndConnector(BuildContext context, int index) {
    Color selfColor = myTimelineStuff[index]["color"] ?? Colors.deepPurple;

    if (index == myTimelineStuff.length - 1) {
      return DecoratedLineConnector(
        thickness: 5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [selfColor, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    }

    Color nextColor = myTimelineStuff[index + 1]["color"] ?? Colors.deepPurple;
    Color blend = Color.alphaBlend(
      selfColor.withAlpha(127),
      nextColor,
    );

    return DecoratedLineConnector(
      thickness: 5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [selfColor, blend],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget getStartConnector(BuildContext context, int index) {
    if (index == 0) {
      return Connector.transparent();
    } else {
      Color selfColor = myTimelineStuff[index]["color"] ?? Colors.deepPurple;
      Color prevColor =
          myTimelineStuff[index - 1]["color"] ?? Colors.deepPurple;
      Color blend = Color.alphaBlend(
        prevColor.withAlpha(127),
        selfColor,
      );
      return DecoratedLineConnector(
        thickness: 5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [blend, selfColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );
    }
  }
}
