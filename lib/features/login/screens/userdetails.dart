import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/model/usermodel.dart';

import '../../../core/constants/asset_constants/asset_constants.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import '../controller/login_controller.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController uname = TextEditingController();
  TextEditingController unumber = TextEditingController();
  TextEditingController ulabel = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    uname = TextEditingController(text: userModel!.name);
    unumber = TextEditingController(text: userModel!.phone);
    ulabel = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    uname.dispose();
    unumber.dispose();
    ulabel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Pallete.darkColor,
            size: h * 0.025,
          ),
        ),
        title: Text(
          'Enter Details',
          style: TextStyle(fontSize: w * 0.047, color: Pallete.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.07,
            ),
            SizedBox(
              height: h * 0.27,
              width: w * 0.6,
              // color: Colors.blue,
              child: const Image(
                image: AssetImage(AssetConstants.logo),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              width: w,
              height: h * 0.5,
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
                  children: [
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.015),
                      child: Container(
                        height: h * 0.06,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Pallete.shadowColor,
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(0, 0)),
                          ],
                          color: Pallete.whiteColor,
                          borderRadius: BorderRadius.circular(h * 0.02),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                          child: TextFormField(
                            controller: uname,
                            decoration: InputDecoration(
                                hintText: 'Enter Name',
                                hintStyle: TextStyle(fontSize: h * 0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.012,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.015),
                      child: Container(
                        height: h * 0.06,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Pallete.shadowColor,
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(0, 0)),
                          ],
                          color: Pallete.whiteColor,
                          borderRadius: BorderRadius.circular(h * 0.02),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                          child: TextFormField(
                            controller: unumber,
                            decoration: InputDecoration(
                                hintText: 'Enter Number',
                                hintStyle: TextStyle(fontSize: h * 0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.012,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.015),
                      child: Container(
                        height: h * 0.06,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Pallete.shadowColor,
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(0, 0)),
                          ],
                          color: Pallete.whiteColor,
                          borderRadius: BorderRadius.circular(h * 0.02),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                          child: TextFormField(
                            controller: ulabel,
                            decoration: InputDecoration(
                                hintText: 'Enter Label',
                                hintStyle: TextStyle(fontSize: h * 0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            ref
                                .read(loginControllerProvider.notifier)
                                .updateUserData(
                                    userName: uname.text.trim(),
                                    phoneNUmber: unumber.text.trim(),
                                    label: ulabel.text.trim(),
                                    context: context);
                          },
                          child: Container(
                            height: h * 0.056,
                            width: w * 0.35,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Pallete.shadowColor,
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0, 0)),
                              ],
                              color: Pallete.secondaryColor,
                              borderRadius: BorderRadius.circular(h * 0.018),
                            ),
                            child: Center(
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: w * 0.035,
                                    color: Pallete.whiteColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
