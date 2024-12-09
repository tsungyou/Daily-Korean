import 'package:flutter/material.dart';
import 'package:runningman_app/models/table.dart';
import 'package:runningman_app/models/description.dart';
import 'package:runningman_app/models/sentence.dart';
import 'package:runningman_app/models/grammar_example_sentences.dart';
import 'package:runningman_app/models/conversation.dart';

class Episode20210321 extends StatelessWidget {
  const Episode20210321({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('20210321'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
