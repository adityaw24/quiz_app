import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {required this.children,
      required this.startColor,
      required this.endColor,
      super.key});

  final Widget children;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: children,
    );
  }
}
