import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart' as models;
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