import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:project_x/firebase_options.dart';
import 'package:project_x/services/firebase_messaging/local_notifications.dart';

class FirebaseNotificationService {
  final localNotifications = LocalNotifications();

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _requestNotificationPermission();

    await localNotifications.init();

    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification != null) {
        localNotifications.showSimpleNotification(
          title: notification.title ?? '',
          body: notification.body ?? '',
          payload: 'hz che eto',
        );
      }
    });
    await appCheck();
  }

  Future<void> appCheck()async{
    if(!kDebugMode) {
      await FirebaseAppCheck.instance.activate(
        appleProvider: AppleProvider.appAttest,
        webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
      );
    } else {
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.debug,
        appleProvider: AppleProvider.debug,
      );
    }

  }

  Future<void> _requestNotificationPermission() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();
  }
}
