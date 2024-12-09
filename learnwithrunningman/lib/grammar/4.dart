import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';


class Grammar4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지만(雖然)'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MultilineDescription(paragraphs: [
              '使用單字:'
            ]),
            LatexStyleTable(tableData: '''
            韓文 & 中文 & 韓文 & 中文 //
            한국말(한국어) & 韓文 & 어렵다 & 難 //
            재미있다 & 有趣 & 형/동생 & 哥哥/弟弟 //
            큳다/작다 & 大/小 & 예요/이에요 & 예요/이에요 //
            '''),
            MultilineDescription(paragraphs: [
              '지만這個連接詞的用法很直觀，跟中文差不多，唯一需要注意的是和中文的次序相反:',
              '雖然... = ...지만',
            ]),
          ],
        ),
      ),
    );
  }
}