import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/core/constants/asset_constants/asset_constants.dart';
import 'package:kalpaka_app/features/login/screens/login_screen.dart';
import 'package:kalpaka_app/features/login/screens/userdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/global_variables/global_variables.dart';
import '../../core/theme/pallete.dart';
import '../../model/usermodel.dart';
import '../home/screen/bottomnavbar_page.dart';
import '../login/controller/login_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future<void> splash() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var prefcheck = prefs.getString("uid");
    Future.delayed(const Duration(seconds: 2), () async {
      if (prefcheck == null || prefcheck == "") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        userModel = await getData(prefcheck.toString());
        print(userModel!.phone.toString());
        if (userModel!.phone.isEmpty) {
          print(1);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const UserDetails()));
        } else if (userModel!.phone.toString() == null) {
          print(2);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const UserDetails()));
        } else {
          print(3);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BottomNav()));
        }
      }
    });
  }

  Future<UserModel> getData(String uid) async {
    var a = await ref
        .watch(loginControllerProvider.notifier)
        .getUser(uid: uid.toString());
    return a;
    // ref.read(userProvider.notifier).update((state) => userModel);
    // if (mounted) {
    //   setState(() {});
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    splash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blackColor,
      body: Center(
        child: SizedBox(
          width: w * 0.6,
          child: Image.asset(AssetConstants.wlogo),
        ),
      ),
    );
  }
}
