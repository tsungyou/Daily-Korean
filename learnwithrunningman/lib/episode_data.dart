import 'package:flutter/material.dart';
import 'episodes/episodes.dart' as episodes;
import 'vocabs/vocabs.dart' as vocabs;
import 'instructions/instructions.dart' as instructions;
final Map<String, Map<String, Widget>> episodeData = {
  '使用教學': {
    'episode': instructions.InstructionEpisodes(),
    'vocabs': instructions.InstructionVocabs(),
    'grammar': instructions.InstructionGrammar(),
  },
  '20210321': {
    'episode': episodes.Episode20210321(),
    'vocabs': vocabs.Episode20210321(),
  },
}; 

