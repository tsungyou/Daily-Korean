import 'package:flutter/material.dart';

final List<Map<String, String>> translations20220529 = [
  {
    'id': '1',
    'korean': '대기실은 2층',
    'traditional': '候車室在二樓',
    'english': 'The waiting room is on the second floor',
  },
  {
    'id': '2',
    'korean': '대기실은 1인1실',
    'traditional': '候車室是一人一室',
    'english': 'The waiting room is one person per room',
  },
  {
    'id': '3',
    'korean': '각자 대가 공간이 분리되어 있음',
    'traditional': '每個人都有自己的獨立空間',
    'english': 'Each person has their own space separated',
  },
  {
    'id': '4',
    'korean': '그렇게 입장을 마친 소민이와 세 게스트',
    'traditional': '入場後，素敏和三位客人',
    'english': 'So, after entering, So-Min and the three guests',
  },
  {
    'id': '5',
    'korean': '그렇게 각자만의 방식으로 대기 시간을 보내는 손님들',
    'traditional': '客人們以各自的方式度過等待時間',
    'english': 'So, each person spends their waiting time in their own way',
  },
  {
    'id': '6',
    'korean': '그렇게 약 20분이 흐른 뒤',
    'traditional': '大約20分鐘後',
    'english': 'So, after about 20 minutes',
  },
  {
    'id': '7',
    'korean': '이제 모여달라는 제작진의 호출 무전',
    'traditional': '製作組呼叫大家集合',
    'english': 'Now, the production team calls everyone to gather',
  },
  {
    'id': '8',
    'korean': '급히 당분 챙기며 퇴장',
    'traditional': '匆忙收拾東西離開',
    'english': 'Quickly grabbing their belongings, they exit',
  },
  {
    'id': '9',
    'korean': '막내PD가 아웃 당했다',
    'traditional': '最年輕的PD離開了',
    'english': 'The youngest PD left.',
  },
  {
    'id': '10',
    'korean': '당황한 표정의 석정',
    'traditional': '石鎮驚訝的表情',
    'english': 'The shocked expression of Seok-jin',
  },
  {
    'id': '11',
    'korean': '연기의 달인 황석정과 뜻밖의 연기 대결',
    'traditional': '演技大師黃石鎮與意外的演技對決',
    'english': 'The acting master Hwang Seok-jin and an unexpected acting battle',
  },
  {
    'id': '12',
    'korean': '그때 나머지 셋도 입장',
    'traditional': '那時，其他三人也進入',
    'english': 'At that time, the other three also entered',
  },
  {
    'id': '13',
    'korean': '어머',
    'traditional': '哎呀',
    'english': 'What?',
  },
  {
    'id': '14',
    'korean': '화들짝',
    'traditional': '嚇一跳',
    'english': 'startled',
  },
  {
    'id': '15',
    'korean': '몰라',
    'traditional': '不知道',
    'english': "I don't know",
  },
  {
    'id': '16',
    'korean': '쓰러진 조연출과 그를 붙잡고 있는 석정',
    'traditional': '倒下的副導演和抓住他的石鎮',
    'english': 'The supporting actor who fell and Seok-jin holding him',
  },
  {
    'id': '17',
    'korean': '경찰 출동',
    'traditional': '警察出動',
    'english': 'Police arrived',
  },
  {
    'id': '18',
    'korean': '형사: 뭐야! 여기 사건 현장이야?',
    'traditional': '刑警：什麼？這是犯罪現場嗎？',
    'english': 'What? This is a crime scene?',
  },
  {
    'id': '19',
    'korean': '급발진하는 상황극에 정신 못 차리는 듯한 석정',
    'traditional': '在緊張的情景劇中，石鎮似乎無法集中精神',
    'english': 'The shocked Seok-jin in the thrilling drama',
  },
  {
    'id': '20',
    'korean': '저희 지금 왔는데요',
    'traditional': '我們剛到',
    'english': 'We just arrived',
  },
  {
    'id': '21',
    'korean': '막내PD의 아웃 사건 현장엔 소민과 게스트 뿐',
    'traditional': '最年輕的PD的事件現場只有素敏和客人',
    'english': "The crime scene of the youngest PD's out incident is only So-Min and the guests",
  },
  {
    'id': '22',
    'korean': '아웃 사건 용의차로 긴급 체포',
    'traditional': '因事件嫌疑被緊急逮捕',
    'english': "The crime scene of the youngest PD's out incident is only So-Min and the guests",
  },
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
                'Translations',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: translations20220529.length,
                itemBuilder: (context, index) {
                  final translation = translations20220529[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translation['korean']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            translation['traditional']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            translation['english']!,
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
