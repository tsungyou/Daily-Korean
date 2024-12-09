import 'package:flutter/material.dart';

final List<Map<String, String>> vocabulary20220529 = [
  {
    'id': '1',
    'korean': '대기실',
    'traditional': '候車室',
    'english': 'waiting room',
  },
  {
    'id': '2',
    'korean': '층',
    'traditional': '樓',
    'english': 'floor',
  },
  {
    'id': '3', 
    'korean': '공간',
    'traditional': '空間',
    'english': 'space',
  },
  {
    'id': '4',
    'korean': '입장',
    'traditional': '入場',
    'english': 'enter',
  },
  {
    'id': '5',
    'korean': '게스트',
    'traditional': '客人',
    'english': 'guest',
  },
  {
    'id': '6',
    'korean': '대기',
    'traditional': '等待',
    'english': 'wait',
  },
  {
    'id': '7',
    'korean': '제작진',
    'traditional': '製作組',
    'english': 'production team',
  },
  {
    'id': '8',
    'korean': '퇴장',
    'traditional': '離開',
    'english': 'exit',
  },
  {
    'id': '9',
    'korean': '막내',
    'traditional': '最年輕',
    'english': 'youngest',
  },
  {
    'id': '10',
    'korean': '당황한',
    'traditional': '驚訝',
    'english': 'shocked',
  },
  {
    'id': '11',
    'korean': '연기',
    'traditional': '演技',
    'english': 'acting',
  },
  {
    'id': '12',
    'korean': '대결',
    'traditional': '對決',
    'english': 'battle',
  },
  {
    'id': '13',
    'korean': '화들짝',
    'traditional': '嚇一跳',
    'english': 'startled',
  },
  {
    'id': '14',
    'korean': '쓰러진',
    'traditional': '倒下',
    'english': 'fallen',
  },
  {
    'id': '15',
    'korean': '경찰',
    'traditional': '警察',
    'english': 'police',
  }
];

class Episode20220529 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode 605'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vocabulary',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: vocabulary20220529.length,
                itemBuilder: (context, index) {
                  final vocab = vocabulary20220529[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vocab['korean']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            vocab['traditional']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            vocab['english']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
