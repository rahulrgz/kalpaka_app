import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Pallete.containerColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: h,
          width: w,
          color: Pallete.containerColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: h * 0.27,
                width: w * 0.6,
                color: Colors.blue,
                // child: const Image(
                //   image: AssetImage(AssetConstants.logo),
                // ),
              ),
              SizedBox(
                height: h * 0.12,
              ),
              Container(
                width: w,
                height: h * 0.34,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Pallete.shadowColor,
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: Offset(4, 1))
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(h * 0.05),
                    topRight: Radius.circular(h * 0.05),
                  ),
                  color: Pallete.primaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: h * 0.04, right: h * 0.04, top: h * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OTP',
                        style: TextStyle(
                            fontSize: w * 0.06, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Enter OTP to Sign in',
                        style: TextStyle(
                          fontSize: w * 0.03,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(height: w * 0.0),
                      ),
                      SizedBox(height: h * 0.03),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: h * 0.065,
                            width: w,
                            decoration: BoxDecoration(
                                color: Pallete.secondaryColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                      offset: Offset(4, 1))
                                ]),
                            child: Center(
                              child: Text(
                                "LOG IN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: h * 0.017),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
