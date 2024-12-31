import 'package:flutter/material.dart';
import 'package:runningman_app/widgets/instructions.dart' as instructions;
class InstructionGrammar extends StatelessWidget {
  const InstructionGrammar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APP使用說明書'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              instructions.buildFeatureSection(
                icon: Icons.book,
                title: 'Grammar',
                description: '所有初階以及中高階的文法',
              ),
              const SizedBox(height: 24),
              const Text(
                '你可以:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              instructions.buildInstructionStep(
                number: '1',
                text: '當作課本、工具書使用。',
              ),
              instructions.buildInstructionStep(
                number: '2',
                text: '透過配合Vocabs以及Episodes使用，建立完整的學習系統。',
              ),
            ],
          ),
        ),
      ),
    );
  }
}