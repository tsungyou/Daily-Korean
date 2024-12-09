import 'package:flutter/material.dart';
import 'grammar/grammars.dart' as grammar;

Map<String, Widget> grammarData = {
  '敬語1: 動詞後綴': grammar.Grammar1(),
  '敬語2: 名詞後綴': grammar.Grammar2(),
  '數字': grammar.Grammar3(),
  '지만(雖然)': grammar.Grammar4(),
  '時間': grammar.Grammar5(),
  '主語助詞(이/가 and 은/는)': grammar.Grammar6(),
  '보다(比較)': grammar.Grammar7(),
  '에서(在)': grammar.Grammar8(),
  '...에서...까지/...부터...까지(從...到...)': grammar.Grammar9(),
};
