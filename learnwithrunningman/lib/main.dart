import 'package:flutter/material.dart';
import 'episode_data.dart';
import 'instruction.dart';
import 'grammar_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  final Map<String, Map<String, Widget>> _episodes = episodeData;
  final Map<String, Widget> _grammars = grammarData;
  void _onBottomNavTapped(int index) {
    setState(() {
      _mainPageIndex = index;
      _initPage = false;
      if (index == 3) { // Grammar tab
        _isGrammarMode = true;
      } else {
        _isGrammarMode = false;
      }
    });
  }

  void _onSidebarTapped(String title) {
    setState(() {
      if (_isGrammarMode) {
        _grammarIndex = _grammars.keys.toList().indexOf(title);
      } else {
        _episodeIndex = _episodes.keys.toList().indexOf(title);
      }
      _initPage = false;
    });
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Settings'),
          content: const Text('Settings options will go here'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showFeedbackDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Feedback'),
          content: const Text('Feedback form will go here'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSubscribeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Subscribe'),
          content: const Text('Subscription options will go here'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _getCurrentPage() {
    if (_isGrammarMode) {
      return _grammars.values.elementAt(_grammarIndex);
    }
    
    final episodeTitle = _episodes.keys.elementAt(_episodeIndex);
    final episodeData = _episodes[episodeTitle]!;
    if (_initPage) {
      return const InstructionPage();
    }
    switch (_mainPageIndex) {
      case 0:
        return episodeData['map']!;
      case 1:
        return episodeData['episode']!;
      case 2:
        return episodeData['dictionary']!;
      default:
        return const InstructionPage();
    }
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                            _showSettingsDialog();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.feedback, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                            _showFeedbackDialog();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.subscriptions, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                            _showSubscribeDialog();
                          },
                        ),
                      ],
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
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
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