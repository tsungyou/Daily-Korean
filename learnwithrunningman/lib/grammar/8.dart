import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';
// page 84
class Grammar8 extends StatelessWidget {
  const Grammar8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('에서(在)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
            LatexStyleTable(tableData: '''
            韓文 & 中文 //
            에서 & 在
            '''),
            MultilineDescription(paragraphs: [
              '에서是「在」的意思，後面接地點。和大部分文法一樣，中文說:',
              '/textbf「在學校」',
              '韓文的順序要是:',
              '/textbf「學校(학교)에서」',
              '是相反的關係!',
            ]),
            ExampleSentence(number: 1, sentence: '학교에 가요. 학교에서 공부합니다.', hiddenWord: '에서', translation: '在學校學習。'),
            ExampleSentence(number: 2, sentence: '극장에 갔어요. 극장에서 영화를 봤어요.', hiddenWord: '에서', translation: '去電影院看了電影。'),
            MultilineDescription(paragraphs: [
              '注意第二句除了「극장에서」之外，還有「극장에」，兩個的差別在:',
            ]),
            LatexStyleTable(tableData: '''
            space & 에서 & 에 //
            使用時機 & 描述做動作的地點 & 描述人或事物
            '''),
            MultilineDescription(paragraphs: [
              '意思是, 如果你想說「我家有冷氣;去家裡」，要用「에」;',
              '如果想說「我在家裡做什麼」，要用「에서」。',
            ]),
            ExampleSentence(number: 3, sentence: '집에  갔어요', hiddenWord: '에 ', translation: '去了家裡'),
            ExampleSentence(number: 4, sentence: '집에  문을 열어요.', hiddenWord: '에 ', translation: '開家裡的門'),
            ExampleSentence(number: 5, sentence: '집에서 공부합니다.', hiddenWord: '에서', translation: '在家裡學習'),
        ]),
      ),
    );
  }
}
