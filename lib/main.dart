import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/global_variables/global_variables.dart';
import 'features/home/bottomnavbar_page.dart';
import 'package:provider/provider.dart';
import 'features/login/auth/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return const MaterialApp(
      title: 'Kalpaka',
      home: BottomNav(),
      debugShowCheckedModeBanner: false,
    );
  }
}
