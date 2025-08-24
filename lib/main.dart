import 'package:cdgi/home1.dart';
import 'package:cdgi/home2.dart';
import 'package:cdgi/login_screen.dart';
import 'package:cdgi/signup_screen.dart';
import 'package:cdgi/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'beu_home.dart';
import 'start_screen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Changed from MaterialApp to GetMaterialApp
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
