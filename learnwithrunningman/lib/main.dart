import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:runningman_app/services/ad_mob_service.dart';
import 'package:runningman_app/views/alphabet_view.dart';
import 'grammar_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:runningman_app/views/views.dart' as views;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initAdFuture = MobileAds.instance.initialize();
  final adMobService = AdMobService(initAdFuture);
// await player.play(AssetSource('audio/my-audio.wav'));
  runApp(MultiProvider(
    providers: [Provider.value(value: adMobService),],
    child: const KoreanApp(),
  ));
}

class KoreanApp extends StatelessWidget {
  const KoreanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Daily Korean',
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
  int _grammarIndex = 0;
  final Map<String, Widget> _grammars = grammarData;
  final List<String> _sidebarTitle = ["貼文", "測驗", "文法", "聊天"];
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
    });
  }
  void _onSidebarTapped(String title) {
    setState(() {
      if (_mainPageIndex == 2) {
        _grammarIndex = _grammars.keys.toList().indexOf(title);
      }
    });
  }
  Widget _getCurrentPage() {
    Widget mainWidget;
    if(_mainPageIndex == 0) {
      mainWidget = const views.Posts();
    } 
    else if (_mainPageIndex == 1) {
      mainWidget = const views.QuizView();
    }
    else if (_mainPageIndex == 2) {
      mainWidget = _grammars.values.elementAt(_grammarIndex);
    }
    else {
      mainWidget = const views.Chat();
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
        title: const Text('Daily Korean'),
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
                color: Colors.black,
                image: DecorationImage(image: AssetImage('assets/decorations/drawerheader.png')),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _sidebarTitle[_mainPageIndex],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  _alphabetWidget(),
                ],
              ),
            ),
            if(_mainPageIndex == 2)
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
            label: '貼文',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: '測驗',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '基礎文法',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '聊天',
          ),
        ],
        currentIndex: _mainPageIndex,
        onTap: _onBottomNavTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );    
  }
  Widget _alphabetWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          foregroundColor: WidgetStateProperty.all(Colors.blue),
          elevation: WidgetStateProperty.all(2),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 12)
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Alphabet()));
        },
        child: const Text(
          "40音",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}