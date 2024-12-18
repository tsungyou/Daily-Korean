import 'package:flutter/material.dart';
import 'episode_data.dart';
import 'grammar_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Running Man App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _mainPageIndex = 0;
  bool _initPage = true;
  int _episodeIndex = 0;
  int _grammarIndex = 0;
  bool _isGrammarMode = false;
  bool _isGrammarInit = true;
  final Map<String, Map<String, Widget>> _episodes = episodeData;
  final Map<String, Widget> _grammars = grammarData;
  void _onBottomNavTapped(int index) {
    setState(() {
      _mainPageIndex = index;
      _initPage = false;
      if (index == 2) {
        _isGrammarMode = true;
      } else {
        _isGrammarMode = false;
      }
    });
  }

  void _onSidebarTapped(String title) {
    setState(() {
      if (_isGrammarMode) {
        _isGrammarInit = false;
        _grammarIndex = _grammars.keys.toList().indexOf(title);
      } else {
        _episodeIndex = _episodes.keys.toList().indexOf(title);
      }
      _initPage = false;
    });
  }

  Widget _getCurrentPage() {
    final episodeTitle = _episodes.keys.elementAt(_episodeIndex);
    final episodeData = _episodes[episodeTitle]!;
    if (_isGrammarMode) {
      if(_isGrammarInit) return episodeData['grammar']!;
      return _grammars.values.elementAt(_grammarIndex);
    }
    if (_initPage) return episodeData['episode']!;
    return episodeData.values.elementAt(_mainPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Running Man'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _isGrammarMode ? '文法' : '集數',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_isGrammarMode)
              ..._grammars.keys.map((grammarTitle) => ListTile(
                    title: Text(grammarTitle),
                    onTap: () {
                      _onSidebarTapped(grammarTitle);
                      Navigator.pop(context);
                    },
                  )).toList()
            else
              ..._episodes.keys.map((episodeTitle) => ListTile(
                    title: Text(episodeTitle),
                    onTap: () {
                      _onSidebarTapped(episodeTitle);
                      Navigator.pop(context);
                    },
                  )).toList(),
          ],
        ),
      ),
      body: Center(
        child: _getCurrentPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Vocabs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Grammar',
          ),
        ],
        currentIndex: _mainPageIndex,
        onTap: _onBottomNavTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );    
  }
}