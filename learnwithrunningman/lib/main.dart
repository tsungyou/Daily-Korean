import 'package:flutter/material.dart';
import 'package:runningman_app/home.dart';
import 'package:runningman_app/onboarding/onboarding.dart';
import 'package:runningman_app/services/ad_mob_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initAdFuture = MobileAds.instance.initialize();
  final adMobService = AdMobService(initAdFuture);
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
      home: const OnboardingView(),
    );
  }
}
