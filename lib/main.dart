import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_x/app.dart';
import 'package:project_x/services/firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseNotificationService().init();
  FirebaseAuth.instance.signOut();
  runApp(const MyApp());
  print('object');
}



