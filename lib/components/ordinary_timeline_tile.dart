import 'package:flutter/material.dart';

class OrdinaryTimelineTile extends StatelessWidget {
  final String eventTitle;
  final String eventDescription;
  final bool? alignAtEnd;

  const OrdinaryTimelineTile({
    super.key,
    required this.eventTitle,
    required this.eventDescription,
    this.alignAtEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: (alignAtEnd ?? false)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            eventTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: (alignAtEnd ?? false) ? TextAlign.right : TextAlign.left,
          ),
          Text(
            eventDescription,
            textAlign: (alignAtEnd ?? false) ? TextAlign.right : TextAlign.left,
          ),
        ],
      ),
    );
  }
}
