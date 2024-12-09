import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';


class Grammar6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('主語助詞(이/가 and 은/는)')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MultilineDescription(paragraphs: [
              '單字:',
            ]),
            LatexStyleTable(tableData: '''
            韓文 & 中文 & 韓文 & 中文 //
            날씨 & 天氣 & 좋다 & 好/喜歡 //
            와다 & 來 & 저기 & 那邊 //
            선생님 & 老師 & 키 & 身高 //
            형 & 哥哥 & 동생 & 弟弟
            '''),
            MultilineDescription(paragraphs: [
              '先說結論: 雖然還是會介紹，但請不要花時間理解或記憶這兩個主詞助詞的差別，或是什麼時候該用哪個，因為',
              '1. 日常生活不會因為用了不對的助詞所以表達錯誤',
              '2. TOPIK不會考相關的內容',
              '只要記得跟一開始介紹敬語一樣，都分成前面的字以子音/母音結尾即可。',
            ]),
            LatexStyleTable(tableData: '''
            space & 이/가 & 은/는 //
            用法 & 指定某個東西/描述新的資訊 & 比較兩件事/普遍事實
            '''),
            ExampleSentence(number: 1, sentence: '날씨가 좋아요', hiddenWord: '날씨', translation: '天氣很好'),
            ExampleSentence(number: 2, sentence: '저기 재준 씨가 와요', hiddenWord: '와요', translation: '載俊從那邊來了'),
            ExampleSentence(number: 3, sentence: '선생님이 키가 커요', hiddenWord: '선생님', translation: '老師很高'),
            ExampleSentence(number: 4, sentence: '형은 키가 커오. 동생은 키가 작아요', hiddenWord: '동생', translation: '哥哥很高。弟弟很矮。'),
          ],
        ),
      ),
    );
  }
}   