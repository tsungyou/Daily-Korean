import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';

class Grammar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('動詞後綴')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MultilineDescription(paragraphs: [
              '這些後綴都是敬語，大致可以分為(以가다(走)為例):',
            ]),
            LatexStyleTable(tableData: '''
            space & 正式 & 非正式(箭頭是語氣) //
            一般 & 갑니다 & 가요 (↘) //
            疑問 & 갑니까? & 가요? (↗) //
            命令 & 가십시오 & 가세요 (↓) //
            呼格 & 갑시다! & 가요 (→)
            '''),
            MultilineDescription(paragraphs: [
              '不需要特別記憶，基本上日常對話都是非正式',
              '不過，不只動詞後綴有正式/非正式，同個動作或是名詞也會有基本/尊敬兩種動詞，例如:',
            ]),
            LatexStyleTable(tableData: '''
            space & 基本 & 尊敬 //
            名字 & 이름 & 성함
            '''),
            MultilineDescription(paragraphs: [
              '就像是中文「名字」和「芳名」的差別，不過現在只需要知道概念就好，日常生活/Running Man中會用到的機率極低外，比起這些，有更重要的東西需要先學。',
            ]),
          ],
        ),
      ),
    );
  }
}