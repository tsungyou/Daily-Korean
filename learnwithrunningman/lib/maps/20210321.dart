import 'package:flutter/material.dart';
import 'package:runningman_app/models/models.dart';

class Episode20210321 extends StatelessWidget {
  const Episode20210321({super.key});

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
          ],
        ),
      ),
    );
  }
}