
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin = 
    FlutterLocalNotificationsPlugin();
  
  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid = 
      const AndroidInitializationSettings("1024");

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,  
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS
    );

    await notificationsPlugin.initialize(initializationSettings, 
    onDidReceiveNotificationResponse: (details) => (),);
  }
}