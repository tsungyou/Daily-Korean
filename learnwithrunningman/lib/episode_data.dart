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
  'Episode 700': {
    'map': maps.Episode20240211(),
    'episode': episodes.Episode20240211(),
    'dictionary': dict.Episode20240211(),
  },
  'Episode 699': {
    'map': maps.Episode20240204(),
    'episode': episodes.Episode20240204(),
    'dictionary': dict.Episode20240204(),
  },
  'Episode 605': {
    'map': maps.Episode20220529(),
    'episode': episodes.Episode20220529(),
    'dictionary': dict.Episode20220529(),
  },
  '20210321': {
    'map': maps.Episode20210321(),
    'episode': episodes.Episode20210321(),
    'dictionary': dict.Episode20210321(),
  },
}; 

