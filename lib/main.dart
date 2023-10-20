import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/core/global_variables/global_variables.dart';
import 'package:kalpaka_app/features/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/home/bottomnavbar_page.dart';
import 'features/login/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return const MaterialApp(
      title: 'Kalpaka',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
