import 'package:flutter/material.dart';
import 'package:runningman_app/widgets/instructions.dart' as instructions;
import 'package:runningman_app/models/models.dart' as models;
class InstructionVocabs extends StatelessWidget {
  const InstructionVocabs({super.key});

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
                icon: Icons.notes,
                title: 'Vocabs',
                description: '以集數區分，會把該集用到的單字都整理出來(同樣會切成很多很多段落)，也會標記有用到的文法，可以直接對應到Grammar的連結。',
              ),
              const SizedBox(height: 24),
              const Text(
                '你可以怎麼使用Vocabs?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              instructions.buildInstructionStep(
                number: '1',
                text: '先使用對應章節的Vocabs(文法可以先跳過)，再去看影片，目標是能聽到所有你在Vocabs看到的單字！',
              ),
              instructions.buildInstructionStep(
                number: '2',
                text: '後續會新增「考試」功能，可以隨機抽考所有看過，或是標記的單字。',
              ),
            ],
          ),
        ),
      ),
    );
  }
}