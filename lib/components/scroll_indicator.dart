import 'package:flutter/material.dart';

class ScrollIndicator extends StatefulWidget {
  final double screenHeight;
  final double appBarHeight;

  const ScrollIndicator({super.key, required this.screenHeight, required this.appBarHeight});

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _opacity = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacity,
      builder: (builder, child) => Opacity(
        opacity: _opacity.value,
        child: child,
      ),
      child: Center(
        child: SizedBox(
          height: widget.screenHeight - widget.appBarHeight - 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Scroll",
                style: TextStyle(fontSize: 18),
              ),
              Icon(Icons.arrow_downward),
            ],
          ),
        ),
      ),
    );
  }
}
