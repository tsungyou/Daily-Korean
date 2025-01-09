import 'package:flutter/material.dart';

class Alphabet extends StatefulWidget {
  const Alphabet({super.key});

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('40音'),
      ),
      body: const SafeArea(
        child: Column(
          children: [Text("123")],
        ),
      ),
    );
  }
}