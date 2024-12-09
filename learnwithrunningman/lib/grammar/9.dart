import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';
// page 85
class Grammar9 extends StatelessWidget {
  const Grammar9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('...에서...까지/...부터...까지(從...到...)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LatexStyleTable(tableData: '''
            韓文 & 中文 & 韓文 & 中文 //
            에서 & 에서 & 부터 & 부터 
            '''),
            LatexStyleTable(tableData: '''
            space & ...에서...까지 & ...부터...까지 //
            用法 & 地點 & 時間
            '''),
            MultilineDescription(paragraphs: [
              '...에서...까지/...부터...까지(從...到...)',
            ]),
            MultilineDescription(paragraphs: [
              '這個文法很簡單，沒什麼特別的，反而是時間的韓文需要學，才用得了부터...까지的文法。',
            ]),
            ExampleSentence(number: 1, sentence: '학교에서 집까지 걷어왔어요.', hiddenWord: '에서', translation: '從學校走到家'), 
            ExampleSentence(number: 2, sentence: '서울에서 부산까지 시간이 얼마나 걸려요.', hiddenWord: '에서', translation: '從首爾到釜山需要多少時間'), 
            ExampleSentence(number: 3, sentence: '오전 9시부터 오후 5시까지 일해요.', hiddenWord: '부터', translation: '從早上9點到下午5點工作'), 
          ],
        ),
      ),
    );
  }
}