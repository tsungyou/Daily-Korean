import 'package:flutter/material.dart';
import 'package:runningman_app/widgets/widgets.dart' as widgets;

class InstructionEpisodes extends StatelessWidget {
  const InstructionEpisodes({super.key});

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
              widgets.buildFeatureSection(
                icon: Icons.tv,
                title: 'Episodes',
                description: '以集數區分,會記錄字幕、對話並翻譯，但想要一口氣看懂整集是不可能的，所以會分成很多個段落，尤其是那些字幕比較多的部分。',
              ),
              const SizedBox(height: 24),
              const Text(
                '你可以怎麼使用Episodes?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              widgets.buildInstructionStep(
                number: '1',
                text: '先去看完對應集數的Vocabs(單字)以及Grammar(文法)，再去看影片，最後才是使用Episodes。',
              ),
              const SizedBox(height: 8),
              widgets.buildInstructionStep(
                number: '1',
                text: '單純當作閱讀的素材，也因為字幕有分成「對話」或是「字幕」，會有口語或是書寫的內容可以學習。',
              ),
            ],
          ),
        ),
      ),
    );
  }
}