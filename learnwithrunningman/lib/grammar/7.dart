import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';
// page 114
class Grammar7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('보다(比較)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LatexStyleTable(tableData: '''
            韓文 & 中文 & 韓文 & 中文 //
            비행기 & 飛機 & 기차 & 火車 //
            빨라다 & 快 & 동생 & 弟弟 //
            언니 & 姐姐 & 더 커다 & 更高 //
            백화점 & 百貨公司 & 더 비싸다 & 更貴 //
            시장 & 市場 & space & space
            '''),
            MultilineDescription(paragraphs: [
              '보다是比較的意思，但中文的順序是「B比A更大」，而韓文的順序要是:',
              'B가 A보다 커다. ',
              '(硬要解釋的話，就是把「比」跟「A」的位置對調，也就是「B(和)A比更大」)',
              '但其實也不用特別記憶，現在請先「知道」這件事，多聽多看後就會習慣了。',
            ]),
            MultilineDescription(paragraphs: ['例句:', '(有認真學上面表格內單字的話，應該要不用看中文也能理解):']),
            ExampleSentence(number: 1, sentence: '비행기가 기차보다 빨라요(飛機比火車快)', hiddenWord: '飛機比火車快', translation: ''),
            ExampleSentence(number: 2, sentence: '동생이 언니보다 커요(妹妹比姐姐高)', hiddenWord: '妹妹比姐姐高', translation: ''),
            ExampleSentence(number: 3, sentence: '백화점이 시장보다 비싸요(百貨公司比市場貴)', hiddenWord: '百貨公司比市場貴', translation: ''),
          ],
        ),
      ),
    );
  }
}
