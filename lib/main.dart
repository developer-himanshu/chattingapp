// ignore_for_file: prefer_const_constructors

// import 'package:chatappp/services/auth/LoginOrRegister.dart';
// import 'dart:js';

import 'package:chatappp/services/auth/auth_gate.dart';
import 'package:chatappp/firebase_options.dart';
// import 'package:chatappp/login_page.dart';
// import 'package:chatappp/pages/register_page.dart';
// import 'package:chatappp/theme/light_mode.dart';
import 'package:chatappp/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:device_preview/device_preview.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(
ChangeNotifierProvider(
  create: (context)=>ThemeProvider(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
