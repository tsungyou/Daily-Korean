import 'package:flutter/material.dart';
import 'package:runningman_app/services/ad_mob_service.dart';
import 'episode_data.dart';
import 'grammar_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initAdFuture = MobileAds.instance.initialize();
  final adMobService = AdMobService(initAdFuture);
  runApp(MultiProvider(
    providers: [Provider.value(value: adMobService)],
    child: const KoreanApp(),
  ));
}

class KoreanApp extends StatelessWidget {
  const KoreanApp({super.key});

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
  int _episodeIndex = 0;
  int _grammarIndex = 0;
  bool _isGrammarMode = false;
  final Map<String, Map<String, Widget>> _episodes = episodeData;
  final Map<String, Widget> _grammars = grammarData;

  // Ad related
  late AdMobService _adMobService;
  BannerAd? _banner;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _adMobService = context.read<AdMobService>();
    _loadAd();
  }

  void _loadAd() {
    _adMobService.initialization.then((value) {
      if (!mounted) return;
      
      final bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: _adMobService.bannerAdUnitId!,
        listener: _adMobService.bannerListener,
        request: const AdRequest(),
      );

      bannerAd.load().then((value) {
        if (!mounted) return;
        setState(() {
          _banner = bannerAd;
        });
      });
    });
  }

  @override
  void dispose() {
    _banner?.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
  }
  void _onBottomNavTapped(int index) {
    setState(() {
      _mainPageIndex = index;
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
        _grammarIndex = _grammars.keys.toList().indexOf(title);
      } else {
        _episodeIndex = _episodes.keys.toList().indexOf(title);
      }
    });
  }
  Widget initPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instruction'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SizedBox(
        height: 60,
        child: AdWidget(ad: _banner!),
      ),      
    );
  }
  Widget _getCurrentPage() {
    final episodeTitle = _episodes.keys.elementAt(_episodeIndex);
    final episodeData = _episodes[episodeTitle]!;
    Widget mainWidget;
    if (_isGrammarMode) {
       mainWidget = _grammars.values.elementAt(_grammarIndex);
    } else {
      mainWidget = episodeData.values.elementAt(_mainPageIndex);
    }
    
    return Column(
      children: [
        Expanded(
          child: mainWidget,
        ),
        if (_banner != null)
          SizedBox(
            height: _banner!.size.height.toDouble(),
            width: _banner!.size.width.toDouble(),
            child: AdWidget(ad: _banner!),
          )
        else 
          const SizedBox(height: 50)
      ],
    );
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
            ..._grammars.keys.map((grammarTitle) => ListTile(
              title: Text(grammarTitle),
              onTap: () {
                _onSidebarTapped(grammarTitle);
                Navigator.pop(context);
              },
            ))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _getCurrentPage()
          )
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Nothing',
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