import 'package:flutter/material.dart';
import 'package:runningman_app/services/ad_mob_service.dart';
import 'episode_data.dart';
import 'grammar_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

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
  InterstitialAd? _interstitial;

  @override
  void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _adMobService = context.read<AdMobService>();
    _loadBannerAd();
    _loadInterstitialAd();
  }
  @override
  void dispose() {
    _banner?.dispose();
    _interstitial?.dispose(); // Dispose interstitial ad
    super.dispose();
  }
  
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: _adMobService.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitial = ad;
        }, 
        onAdFailedToLoad: (LoadAdError error) {
          _interstitial = null;
        },
      ),
    );
  }
  void _showInterstitialAd() {
    if(_interstitial != null) {
      _interstitial!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _loadInterstitialAd(); // load another but not shown yet;
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          _loadInterstitialAd(); 
        },
        onAdShowedFullScreenContent: (InterstitialAd ad) {
        },
      );
      _interstitial!.show();
      _interstitial = null;
    } else {
      _loadInterstitialAd(); // Try to load a new ad if none is available
    }
  }
  void _loadBannerAd() {
    _adMobService.initialization.then((value) {
      
      final bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: _adMobService.bannerAdUnitId!,
        listener: _adMobService.bannerListener,
        request: const AdRequest(),
      );

      bannerAd.load().then((value) {
        setState(() {
          _banner = bannerAd;
        });
      });
    });
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
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              _showInterstitialAd();
            },
          ),
        ],
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
            if(_isGrammarMode)
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