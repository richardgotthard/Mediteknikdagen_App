import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mtd_app/splash_page.dart';
import 'mainpage/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MTD',
      // home: MountsApp(),
      home: SplashPage(),
    );
  }
}
