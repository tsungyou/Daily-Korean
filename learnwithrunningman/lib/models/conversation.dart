import 'package:flutter/material.dart';

class Conversation extends StatelessWidget {
  final List<String> lines;
  final double lineSpacing;
  final TextStyle? textStyle;

  const Conversation({
    super.key,
    required this.lines,
    this.lineSpacing = 8.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: lines.map((line) {
          return Padding(
            padding: EdgeInsets.only(bottom: lineSpacing),
            child: Text(
              line,
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
          );
        }).toList(),
      ),
    );
  }
}
