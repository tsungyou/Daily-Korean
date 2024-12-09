import 'package:flutter/material.dart';

class ExampleSentence extends StatefulWidget {
  final int number;
  final String sentence;
  final String hiddenWord;
  final String translation;

  const ExampleSentence({
    super.key,
    required this.number,
    required this.sentence,
    required this.hiddenWord,
    required this.translation,
  });

  @override
  State<ExampleSentence> createState() => _ExampleSentenceState();
}

class _ExampleSentenceState extends State<ExampleSentence> {
  bool _isWordVisible = false;

  @override
  Widget build(BuildContext context) {
    final displayedSentence = _isWordVisible 
        ? widget.sentence 
        : widget.sentence.replaceAll(widget.hiddenWord, '_' * widget.hiddenWord.length);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${widget.number}. ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(displayedSentence),
            ),
            IconButton(
              icon: Icon(_isWordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isWordVisible = !_isWordVisible;
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            widget.translation,
            style: TextStyle(
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}