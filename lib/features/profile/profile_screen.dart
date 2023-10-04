import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/features/document/document_screen.dart';
import 'package:kalpaka_app/features/orders/order_screen.dart';
import 'package:kalpaka_app/features/staff/staff_page.dart';

import '../../core/global_variables/global_variables.dart';
import '../../core/theme/pallete.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.containerColor,
      appBar: AppBar(
        backgroundColor: Pallete.containerColor,
        toolbarHeight: h * 0.08,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              size: h * 0.03,
              color: Pallete.darkColor,
            )),
        title: Text(
          'PROFILE',
          style: TextStyle(fontSize: h * 0.025, color: Pallete.darkColor),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(h * 0.03),
                child: Container(
                  width: w,
                  height: h * 0.13,
                  decoration: BoxDecoration(
                    color: Pallete.darkColor,
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      CircleAvatar(
                        foregroundImage: const NetworkImage(
                            'https://rahulrgz.github.io/rahul/assets/img/profile-img.png'),
                        radius: h * 0.03,
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rahul Ramesh',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.025,
                                color: Pallete.whiteColor),
                          ),
                          Text(
                            '+91 9744 930917',
                            style: TextStyle(
                                fontSize: h * 0.015, color: Pallete.whiteColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: h * 0.03, right: h * 0.03, bottom: h * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                          color: Pallete.shadowColor,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 0)),
                    ],
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.007,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const StaffScreen()),
                          );
                        },
                        leading: Icon(
                          CupertinoIcons.person_2,
                          size: h * 0.023,
                        ),
                        title: const Text('Staff Details'),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const OrderScreen()),
                          );
                        },
                        leading: Icon(
                          CupertinoIcons.cart,
                          size: h * 0.023,
                        ),
                        title: const Text('Orders'),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const DocumentScreen()),
                          );
                        },
                        leading: Icon(
                          CupertinoIcons.doc_chart,
                          size: h * 0.023,
                        ),
                        title: const Text('Documents'),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          CupertinoIcons.chart_bar_square,
                          size: h * 0.023,
                        ),
                        title: const Text('Analysis'),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          CupertinoIcons.bell,
                          size: h * 0.023,
                        ),
                        title: const Text('Notifications'),
                      ),
                      SizedBox(
                        height: h * 0.007,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: h * 0.03, right: h * 0.03, bottom: h * 0.03),
                child: Container(
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                          color: Pallete.shadowColor,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 0)),
                    ],
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.007,
                      ),
                      ListTile(
                        leading: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.pencil_ellipsis_rectangle,
                              size: h * 0.03,
                            )),
                        title: const Text('Change Password'),
                      ),
                      ListTile(
                        leading: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.settings,
                              size: h * 0.03,
                            )),
                        title: const Text('Settings'),
                      ),
                      SizedBox(
                        height: h * 0.007,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'SIGN OUT',
              style: TextStyle(
                  fontSize: h * 0.017,
                  fontWeight: FontWeight.bold,
                  color: Pallete.darkColor),
            ),
          ),
          SizedBox(
            height: h * 0.007,
          ),
          Text(
            'Version 1.0.0',
            style: TextStyle(
                fontSize: h * 0.017,
                fontWeight: FontWeight.w300,
                color: Pallete.darkColor),
          )
        ],
      ),
    );
  }
}
