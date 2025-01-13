
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
    onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {});
  }
  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails("channelId", "channelName", importance: Importance.max),
      iOS: DarwinNotificationDetails(),
    );
  }
  Future showNotification({int id = 0, String? title, String? body, String? payload})  async {
    return notificationsPlugin.show(
      id, title, body, await notificationDetails()
    );
  }
}