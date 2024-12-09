import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String text;

  const Description({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class MultilineDescription extends StatelessWidget {
  final List<String> paragraphs;

  const MultilineDescription({
    super.key, 
    required this.paragraphs,
  });

  TextStyle _getTextStyle(String text) {
    bool isBold = text.contains('/textbf');
    return TextStyle(
      fontSize: 16,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
  }

  String _cleanText(String text) {
    return text
        .replaceAll('/textbf', '')
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: paragraphs.map((paragraph) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _cleanText(paragraph),
                style: _getTextStyle(paragraph),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }
}
