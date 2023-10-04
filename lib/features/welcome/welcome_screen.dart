import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/home/home_screen.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/asset_constants/asset_constants.dart';
import '../../core/global_variables/global_variables.dart';
import '../login/screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      appBar: AppBar(
        backgroundColor: Pallete.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: h * 0.1,
        elevation: 0,
        title: const Text(
          'WELCOME',
          style: TextStyle(color: Pallete.secondaryColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SizedBox(
              child: Lottie.asset(AssetConstants.loginLottie, width: w * 0.8),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(
                  left: h * 0.05, right: h * 0.06, bottom: h * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "KALPAKA AUTOCRAFT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Pallete.secondaryColor,
                        fontSize: h * 0.02),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        color: Pallete.secondaryColor, fontSize: h * 0.004),
                  ),
                  Text(
                    'This is a register app for KALPAKA AUTOCRAFT which helps to know the exact working hours of their employees and the overtime taken by their workers so that the employees get paid as per their work.',
                    style: TextStyle(
                        color: Pallete.secondaryColor, fontSize: h * 0.012),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.1)),
                    backgroundColor: Pallete.secondaryColor,
                    maximumSize: Size(w * 0.8, h * 0.07)),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Continue '), Icon(Icons.arrow_forward)],
                  ),
                )),
          ),
          SizedBox(
            height: h * 0.03,
          )
        ],
      ),
    );
  }
}
