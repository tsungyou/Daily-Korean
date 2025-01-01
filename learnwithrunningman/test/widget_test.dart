// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:runningman_app/main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:runningman_app/services/ad_mob_service.dart';

void main() {
  setUp(() {
    // Initialize MobileAds with a mock
    MobileAds.instance.initialize();
  });

  testWidgets('App should render without crashing', (WidgetTester tester) async {
    final initAdFuture = MobileAds.instance.initialize();
    final adMobService = AdMobService(initAdFuture);

    // Build our app and trigger a frame
    await tester.pumpWidget(
      MultiProvider(
        providers: [Provider.value(value: adMobService)],
        child: const KoreanApp(),
      ),
    );

    // Verify that the app starts with Running Man title
    expect(find.text('Running Man'), findsOneWidget);
    
    // Test bottom navigation
    expect(find.text('Posts'), findsOneWidget);
    expect(find.text('Grammar'), findsOneWidget);
    
    // Test navigation
    await tester.tap(find.text('Grammar'));
    await tester.pumpAndSettle();
    
    // Verify grammar mode is active
    expect(find.text('文法'), findsOneWidget);
  });
}
