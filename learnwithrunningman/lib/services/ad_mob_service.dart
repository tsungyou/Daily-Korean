import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class AdMobService {
  Future<InitializationStatus> initialization;

  AdMobService(this.initialization);

  // generate few helpers

  String? get bannerAdUnitId {
    // in production
    print(Platform.isIOS);
    print(Platform.isAndroid);
    if (kReleaseMode) {
      if (Platform.isIOS) {
        return "ca-app-pub-7527196138005649/9403685097";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-7527196138005649/2188342382";
      }
    } else {
      if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/2934735716";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/6300978111";
      }
    }
    return null;
  }

    String? get interstitialAdUnitId {
    // in production
    if (kReleaseMode) {
      if (Platform.isIOS) {
        return "ca-app-pub-7527196138005649/4007054031";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-7527196138005649/5807785510";
      }
    } else {
      if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/2934735716";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/6300978111";
      }
    }
    return null;
  }

    String? get rewardedAdUnitId {
    // in production
    if (kReleaseMode) {
      if (Platform.isIOS) {
        return "ca-app-pub-7527196138005649/7873877354";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-7527196138005649/1928250258";
      }
    } else {
      if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/2934735716";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/6300978111";
      }
    }
    return null;
  }

  final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (Ad ad) => print("ad Loaded"),
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
      print("Ad failed to load: $error");
    },
    onAdOpened: (Ad ad) => print("ad opened"),
    onAdClosed: (Ad ad) => print("ad closed"),
  );
}