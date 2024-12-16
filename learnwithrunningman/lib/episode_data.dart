import 'package:flutter/material.dart';
import 'episodes/episodes.dart' as episodes;
import 'maps/maps.dart' as maps; 
import 'dictionaries/dictionaries.dart' as dict;
import 'instruction.dart';
final Map<String, Map<String, Widget>> episodeData = {
  'Instruction': {
    'map': InstructionPage(),
    'episode': InstructionPage(),
    'dictionary': InstructionPage(),
  },
  '20210321': {
    'map': maps.Episode20210321(),
    'episode': episodes.Episode20210321(),
    'dictionary': dict.Episode20210321(),
  },
}; 

