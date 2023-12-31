import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/core/constants/asset_constants/asset_constants.dart';
import 'package:kalpaka_app/core/global_variables/global_variables.dart';
import 'package:kalpaka_app/features/login/controller/login_controller.dart';
import '../../../core/theme/pallete.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void googlesignin({required BuildContext context}) {
    ref.read(loginControllerProvider.notifier).googlesignin(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Pallete.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: h,
          width: w,
          color: Pallete.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.27,
                width: w * 0.6,
                // color: Colors.blue,
                child: const Image(
                  image: AssetImage(AssetConstants.logo),
                ),
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
                  color: Pallete.notwhiteColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: h * 0.04, right: h * 0.04, top: h * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: w * 0.06, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sign in to get started quickly',
                        style: TextStyle(
                          fontSize: w * 0.03,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            //googlesignin( context: context);
                          },
                          child: Container(
                            height: h * 0.065,
                            width: w,
                            decoration: BoxDecoration(
                              color: Pallete.whiteColor,
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  spreadRadius: 0.5,
                                  offset: Offset(2, -1),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: w * 0.03,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      const AssetImage(AssetConstants.apple),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                Text(
                                  "Sign in with Apple",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: h * 0.016),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.03),
                      Center(
                        child: InkWell(
                          onTap: () {
                            googlesignin(context: context);
                          },
                          child: Container(
                            height: h * 0.065,
                            width: w,
                            decoration: BoxDecoration(
                                color: Pallete.whiteColor,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      spreadRadius: 0.5,
                                      offset: Offset(2, -1))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: w * 0.03,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      const AssetImage(AssetConstants.google),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                Text(
                                  "Sign in with Google",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: h * 0.016),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
