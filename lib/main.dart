import 'package:cdgi/login_screen.dart';
import 'package:cdgi/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'start_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  // Changed from MaterialApp to GetMaterialApp
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StartScreen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
