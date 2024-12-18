import 'package:flutter/material.dart';
import 'package:runningman_app/widgets/instructions.dart' as instructions;
import 'package:runningman_app/models/models.dart' as models;
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
              models.MultilineDescription(paragraphs: [
                '此app是提供給會40以及',
                '1. 不知道怎麼自學韓文',
                '2. 想透過런닝맨學韓文的人',
                '3. 想沒有壓力的學習韓文',
                '4. 平常沒有額外精力每天花時間學習的人',
                '5. 正在學習韓文，把app當作工具書',
                '所以設計會以自學、整合為原則,使用者可以每天花幾分鐘時間閱讀任意章節，達到作者認為學語言比起每天死背更重要的事情:',
                '「讓語言成為生活的一部分!」',
              ]),
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