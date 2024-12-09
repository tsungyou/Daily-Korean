import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';


class Grammar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('名詞後綴')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LatexStyleTable(tableData: '''
            正式 & 非正式 //
            입니다 & 예요/이에요 
            '''),
            MultilineDescription(paragraphs: [
              '입니다是正式的，在前一章有稍微提過，而예요/이에요 是非正式的(但還是敬語!)',
              '예요/이에요則是差在前一個字以:',
            ]),
            LatexStyleTable(tableData: '''
            space & 母音結尾 & 子音結尾 //
            後綴 & 예요 & 이에요 //
            範例 & 사과예요(蘋果) & 학생이에요(學生)
            '''),
            ExampleSentence(number: 1, sentence: '사과예요', hiddenWord: '예요', translation: '蘋果'),
            ExampleSentence(number: 2, sentence: '학생이에요', hiddenWord: '이에요', translation: '學生'),
            MultilineDescription(paragraphs: [
              '以下是一段對話練習:',
            ]),
            Conversation(
              lines: [
                'A: 안녕하세요. 학생이에요?',
                'B: 아니요, 선생님이에요.',
                'A: 아, 선생님이세요?',
                'B: 네, 한국어 선생님이에요.',
              ],
            ),
            Conversation(
              lines: [
                'A: 안녕하세요. 학생이에요?',
                'B: 아니요, 선생님이에요.',
                'A: 아, 선생님이세요?',
                'B: 네, 한국어 선생님이에요.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}   