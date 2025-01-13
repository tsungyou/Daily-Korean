import 'package:flutter/material.dart';
import 'package:runningman_app/home.dart';
import 'package:runningman_app/onboarding/onboarding.dart';
import 'package:runningman_app/services/ad_mob_service.dart';
import 'package:runningman_app/services/auth_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // firebase
  await Firebase.initializeApp();
  AuthService().getOrCreateUser();
  // advertise
  final initAdFuture = MobileAds.instance.initialize();
  final adMobService = AdMobService(initAdFuture);
  // personal data
  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(MultiProvider(
    providers: [Provider.value(value: adMobService)],
    child: KoreanApp(showOnboarding: !hasSeenOnboarding),
  ));
}

class KoreanApp extends StatelessWidget {
  final bool showOnboarding;
  const KoreanApp({super.key, required this.showOnboarding});

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
      home: showOnboarding ? const OnboardingView() : const HomePage(),
    );
  }
}
