import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class AdMobService {
  Future<InitializationStatus> initialization;

  AdMobService(this.initialization);

  // generate few helpers

  String? get bannerAdUnitId {
    // in production
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
        return "ca-app-pub-3940256099942544/4411468910";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/1033173712";
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
        return "ca-app-pub-3940256099942544/1712485313";
      } else if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/5224354917";
      }
    }
    return null;
  }

  final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (Ad ad) => {},
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
    },
    onAdOpened: (Ad ad) => {},
    onAdClosed: (Ad ad) => {},
  );
}