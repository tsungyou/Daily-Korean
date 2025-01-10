import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Alphabet extends StatefulWidget {
  const Alphabet({super.key});

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('40音'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(6.0), 
              child: Text(
                "韓文有40音，其中也像英文一樣包含母音以及子音，但母音和子音的關係比英文更明顯一點。(點擊韓文字可以聽聲音) \n \n子音有他自己的「名字」，但是和實際的發音並不相同，也不需要去記憶，如果好奇可以點開聽聽看，但主要會用和「ㅏ」結合的聲音背，就像日語會用「ka ki ku ke ko」一樣",
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
            ),
            _vowelInfo("母音1", 1),
            _vowelInfo("母音2", 2),
            _consonantInfo("子音1", 1),
            _consonantInfo("子音2", 2),
            const Padding(
              padding: EdgeInsets.all(6.0), 
              child: Text(
                "",
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _vowelInfo(String title, index) {
    List<Map<String, String>> vowels;
    if (index == 1){
      vowels = [
        {'symbol': 'ㅏ', 'sound': 'alphabet_audio/ㅏ.wav'},
        {'symbol': 'ㅑ', 'sound': 'alphabet_audio/ㅑ.wav'},
        {'symbol': 'ㅓ', 'sound': 'alphabet_audio/ㅓ.wav'},
        {'symbol': 'ㅕ', 'sound': 'alphabet_audio/ㅕ.wav'},
        {'symbol': 'ㅗ', 'sound': 'alphabet_audio/ㅗ.wav'},
        {'symbol': 'ㅛ', 'sound': 'alphabet_audio/ㅛ.wav'},
        {'symbol': 'ㅜ', 'sound': 'alphabet_audio/ㅜ.wav'},
        {'symbol': 'ㅠ', 'sound': 'alphabet_audio/ㅠ.wav'},
        {'symbol': 'ㅐ', 'sound': 'alphabet_audio/ㅐ.wav'},
        {'symbol': 'ㅒ', 'sound': 'alphabet_audio/ㅒ.wav'},
        {'symbol': 'ㅔ', 'sound': 'alphabet_audio/ㅔ.wav'},
        {'symbol': 'ㅖ', 'sound': 'alphabet_audio/ㅖ.wav'},
        {'symbol': 'ㅡ', 'sound': 'alphabet_audio/ㅡ.wav'},
        {'symbol': 'ㅣ', 'sound': 'alphabet_audio/ㅣ.wav'},
      ];
    } else {
      vowels = [
        {'symbol': 'ㅘ', 'sound': 'alphabet_audio/ㅘ.wav'},
        {'symbol': 'ㅙ', 'sound': 'alphabet_audio/ㅙ.wav'},
        {'symbol': 'ㅚ', 'sound': 'alphabet_audio/ㅚ.wav'},
        {'symbol': 'ㅝ', 'sound': 'alphabet_audio/ㅝ.wav'},
        {'symbol': 'ㅞ', 'sound': 'alphabet_audio/ㅞ.wav'},
        {'symbol': 'ㅟ', 'sound': 'alphabet_audio/ㅟ.wav'},
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 10,
          children: vowels.map((vowel) {
            return ElevatedButton(
              onPressed: () => _playSound(vowel['sound']!),
              child: Text(
                vowel['symbol']!,
                style: const TextStyle(fontSize: 24),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _consonantInfo(String title, index) {
    final List<Map<String, String>> consonants;
    if (index == 1) {
      consonants = [
        {'symbol': 'ㄱ', 'sound': 'alphabet_audio/ㄱ.wav'},
        {'symbol': 'ㄴ', 'sound': 'alphabet_audio/ㄴ.wav'},
        {'symbol': 'ㄷ', 'sound': 'alphabet_audio/ㄷ.wav'},
        {'symbol': 'ㄹ', 'sound': 'alphabet_audio/ㄹ.wav'},
        {'symbol': 'ㅁ', 'sound': 'alphabet_audio/ㅁ.wav'},
        {'symbol': 'ㅂ', 'sound': 'alphabet_audio/ㅂ.wav'},
        {'symbol': 'ㅇ', 'sound': 'alphabet_audio/ㅇ.wav'},
        {'symbol': 'ㅈ', 'sound': 'alphabet_audio/ㅈ.wav'},
        {'symbol': 'ㅊ', 'sound': 'alphabet_audio/ㅊ.wav'},
        {'symbol': 'ㅋ', 'sound': 'alphabet_audio/ㅋ.wav'},
        {'symbol': 'ㅌ', 'sound': 'alphabet_audio/ㅌ.wav'},
        {'symbol': 'ㅍ', 'sound': 'alphabet_audio/ㅍ.wav'},
      ];
    } else {
      consonants = [
        {'symbol': 'ㄲ', 'sound': 'alphabet_audio/ㄲ.wav'},
        {'symbol': 'ㄸ', 'sound': 'alphabet_audio/ㄸ.wav'},
        {'symbol': 'ㅃ', 'sound': 'alphabet_audio/ㅃ.wav'},
        {'symbol': 'ㅆ', 'sound': 'alphabet_audio/ㅆ.wav'},
        {'symbol': 'ㅉ', 'sound': 'alphabet_audio/ㅉ.wav'},
      ];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 10,
          children: consonants.map((consonant) {
            return ElevatedButton(
              onPressed: () => _playSound(consonant['sound']!),
              child: Text(
                consonant['symbol']!,
                style: const TextStyle(fontSize: 24),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _playSound(String soundPath) async {
    await _player.stop();
    await _player.play(AssetSource(soundPath));
  }
}
