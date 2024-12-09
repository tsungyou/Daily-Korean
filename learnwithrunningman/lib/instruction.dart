import 'package:flutter/material.dart';
import 'package:runningman_app/models/table.dart';
import 'package:runningman_app/models/description.dart';
import 'package:runningman_app/models/sentence.dart';
import 'package:runningman_app/models/grammar_example_sentences.dart';
import 'package:runningman_app/models/conversation.dart';
class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

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
              MultilineDescription(paragraphs: [
                '此app是提供給會40以及',
                '1.不知道怎麼自學韓文',
                '2. 想透過런닝맨學韓文的人',
                '3. 想沒有壓力的學習韓文',
                '4. 平常沒有額外精力每天花時間學習的人',
                '5. 正在學習韓文，把app當作工具書',
                '所以設計會以自學、整合為原則，使用者可以每天花幾分鐘時間閱讀任意章節，達到作者認為學語言比起每天死背更重要的事情:',
                '*****讓語言成為生活的一部分!*****',
              ]),
              const SizedBox(height: 16),
              _buildFeatureSection(
                icon: Icons.map,
                title: 'Maps',
                description: '以集數區分，只要有去哪些餐廳、景點都會努力記錄下來，讓大家朝聖更輕鬆!',
              ),
              const SizedBox(height: 16),
              _buildFeatureSection(
                icon: Icons.tv,
                title: 'Episodes',
                description: '以集數區分，主要會把字幕翻譯，建議先看完再去找那一集的影片練習!(例如: 先看完605集的episodes內容，再去看605集的影片練習閱讀特殊的字幕，一來一往很快就可以看懂了!。)',
              ),
              const SizedBox(height: 16),
              _buildFeatureSection(
                icon: Icons.book,
                title: 'Dictionary',
                description: '以集數區分，會把該集用到的單字都整理出來，並附上發音，一樣先學習，再去看影片，想辦法聽出越多單字越好!',
              ),
              const SizedBox(height: 16),
              _buildFeatureSection(
                icon: Icons.book,
                title: 'Grammar 使用說明書',
                description: '絕大部分的章節都是由「該章節會使用到的單字」=>「文法學習」=>「例句」組成，目的在學文法的同時一起學單字，不要特別花時間分別學習文法以及單字。所以請先將單字記下來，再學習文法，最後將學到的單字以及文法結合，透過例句練習。',
              ),
              const SizedBox(height: 24),
              const Text(
                '如果你是:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildInstructionStep(
                number: '1',
                text: '有基礎者(知道名詞動詞後綴的用法)可以從任何你有興趣的地方開始。',
              ),
              _buildInstructionStep(
                number: '2',
                text: '沒有基礎，只記得40音發音的人，務必先將Grammar的前幾章節看完(包括後綴、敬語、主詞助詞的用法)，再開始閱讀其他章節。',
              ),
              _buildInstructionStep(
                number: '3',
                text: '完全不會的人，請先去youtube看40音的教學影片，再開始使用本app。',
              ),
                            const SizedBox(height: 24),
              const Text(
                '使用步驟(除Grammar外):',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildInstructionStep(
                number: '1',
                text: '先從該集的Dictionary開始，將單字記下來。',
              ),
              _buildInstructionStep(
                number: '2',
                text: '接下來去看那一集的Running man，試著聽出剛剛記下的單字，並且試著看懂字幕。',
              ),
              _buildInstructionStep(
                number: '3',
                text: '最後，閱讀該集的Episodes的內容，所有字幕(包括說話的字幕以及特效字幕)都會翻譯，學習該集的句子後馬上會有練習題檢驗有沒有認真學習!',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionStep({
    required String number,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}