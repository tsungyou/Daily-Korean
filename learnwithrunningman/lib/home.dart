import 'package:flutter/material.dart';
import 'package:runningman_app/services/ad_mob_service.dart';
import 'package:runningman_app/views/purchase_view.dart';
import 'grammar_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:runningman_app/views/views.dart' as views;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _mainPageIndex = 0;
  int _grammarIndex = 0;
  final Map<String, Widget> _grammars = grammarData;
  final List<String> _sidebarTitle = ["貼文", "40音", "文法", "聊天"];
  // Ad related
  late AdMobService _adMobService;
  BannerAd? _banner;
  InterstitialAd? _interstitial;
  RewardedAd? _rewarded;


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
    _loadRewardedAd();
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
  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: _adMobService.rewardedAdUnitId!, 
      request: const AdRequest(), 
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          setState(() {
            _rewarded = ad;
          });
        }, 
        onAdFailedToLoad: (LoadAdError error){
          setState(() {
            _rewarded = null;
          });
        }));
  }
  void _showRewardedAd() {
    if(_rewarded != null) {
      _rewarded!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          ad.dispose();
          _loadRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          ad.dispose();
          _loadRewardedAd();
        }
      );

      _rewarded!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        _increaseCounter(2);
      });   
    }
  }
  void _increaseCounter(quantity) {
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
      mainWidget = const views.Alphabet();
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
  Widget _rewardedPrompt() {
    if(_rewarded == null) { return Container(); }
    return IconButton(onPressed: _showRewardedAd, icon: const Icon(Icons.read_more));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Korean'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PurchaseView(),
                  ),
                );
            });}, 
            icon: const Icon(Icons.shopping_bag)),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              _showInterstitialAd();
            },
          ),
          _rewardedPrompt(),
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
            child: _getCurrentPage(),
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
            label: '40音',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '基礎文法',
          ),
        ],
        currentIndex: _mainPageIndex,
        onTap: _onBottomNavTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );    
  }
}