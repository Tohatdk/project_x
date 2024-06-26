import 'package:flutter/material.dart';
import 'package:project_x/app.dart';
import 'package:project_x/di_dart.dart';
import 'package:project_x/services/firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseNotificationService().init();
  setup();

  runApp(const MyApp());
}
