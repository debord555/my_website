import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_website/components/ordinary_timeline_tile.dart';
import 'package:my_website/constants.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
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
              startConnectorBuilder: (context, index) => (index == 0)
                  ? Connector.transparent()
                  : Connector.solidLine(
                      thickness: 5,
                      color: Colors.deepPurple,
                    ),
              endConnectorBuilder: (context, index) =>
                  (index == myTimelineStuff.length - 1)
                      ? DecoratedLineConnector(
                          thickness: 5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.deepPurple, Colors.transparent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        )
                      : Connector.solidLine(
                          thickness: 5,
                          color: Colors.deepPurple,
                        ),
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
}
