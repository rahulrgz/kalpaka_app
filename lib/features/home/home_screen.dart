import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/document/add_document.dart';
import 'package:kalpaka_app/features/document/document_screen.dart';
import 'package:kalpaka_app/features/orders/add_order.dart';
import 'package:kalpaka_app/features/orders/order_screen.dart';
import 'package:kalpaka_app/features/profile/profile_screen.dart';
import 'package:kalpaka_app/features/staff/Screen/add_staff.dart';
import 'package:kalpaka_app/features/staff/Screen/office_staff.dart';
import 'package:kalpaka_app/features/staff/Screen/staff_page.dart';

import '../../core/commons/error.dart';
import '../../core/commons/loader.dart';
import '../../core/global_variables/global_variables.dart';
import '../analysis/screen/analysis_screen.dart';
import '../login/controller/login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double thumbPosition = 0.0;
  bool sliding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.darkColor,
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ref.watch(getUserDataProvider).when(
              data: (data) {
                return SafeArea(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen()),
                                  );
                                },
                                child: CircleAvatar(
                                  foregroundImage:
                                      NetworkImage(data.profile.toString()),
                                  radius: h * 0.025,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome,',
                                    style: TextStyle(
                                        fontSize: h * 0.012,
                                        color: Pallete.primaryColor),
                                  ),
                                  Text(
                                    data.name,
                                    style: TextStyle(
                                        fontSize: h * 0.023,
                                        fontWeight: FontWeight.bold,
                                        color: Pallete.primaryColor),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: h * 0.023,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: h * 0.022,
                                  backgroundColor: Pallete.darkColor,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        CupertinoIcons.bell,
                                        color: Pallete.whiteColor,
                                        size: h * 0.016,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: h * 1.02,
                          width: w,
                          decoration: BoxDecoration(
                              color: Pallete.primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(h * 0.05),
                                  topLeft: Radius.circular(h * 0.05))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: h * 0.07,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: h * 0.23,
                                    width: w * 0.38,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(h * 0.03),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Pallete.shadowColor,
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(0, 0)),
                                      ],
                                      color: Pallete.whiteColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(h * 0.03),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'View >',
                                                style: TextStyle(
                                                    fontSize: h * 0.012,
                                                    color: Pallete.darkColor),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: h * 0.01),
                                          Text("28",
                                              style: TextStyle(
                                                  fontSize: h * 0.04,
                                                  fontWeight: FontWeight.w800,
                                                  color: Pallete.darkColor)),
                                          Text(
                                            "No.of Staff",
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        const StaffScreen()),
                                              );
                                            },
                                            child: Container(
                                              height: h * 0.05,
                                              width: w * 0.25,
                                              decoration: BoxDecoration(
                                                color: Pallete.blackColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        h * 0.01),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'VIEW ALL',
                                                  style: TextStyle(
                                                      fontSize: h * 0.016,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Pallete.whiteColor),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: h * 0.23,
                                    width: w * 0.38,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(h * 0.03),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Pallete.shadowColor,
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(4, 4)),
                                      ],
                                      color: Pallete.whiteColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(h * 0.03),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'View >',
                                                style: TextStyle(
                                                    fontSize: h * 0.012,
                                                    color: Pallete.darkColor),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: h * 0.01),
                                          Text("13",
                                              style: TextStyle(
                                                  fontSize: h * 0.04,
                                                  fontWeight: FontWeight.w800,
                                                  color: Pallete.darkColor)),
                                          Text(
                                            "No.of Documents",
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        const StaffScreen()),
                                              );
                                            },
                                            child: Container(
                                              height: h * 0.05,
                                              width: w * 0.25,
                                              decoration: BoxDecoration(
                                                color: Pallete.blackColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        h * 0.01),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'VIEW ALL',
                                                  style: TextStyle(
                                                      fontSize: h * 0.016,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Pallete.whiteColor),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.05,
                              ),
                              Container(
                                height: h * 0.15,
                                width: w * 0.85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h * 0.03),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Pallete.shadowColor,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(0, 0)),
                                  ],
                                  color: Pallete.whiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: h * 0.1,
                                      width: w * 0.16,
                                      // color: Pallete.containerColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Pallete.primaryColor,
                                            radius: h * 0.027,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            const AddOrder()),
                                                  );
                                                },
                                                icon: Icon(
                                                  CupertinoIcons
                                                      .cart_badge_plus,
                                                  size: h * 0.022,
                                                  color: Pallete.darkColor,
                                                )),
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Text(
                                            'Add',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                          Text(
                                            'Order',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.1,
                                      width: w * 0.16,
                                      // color: Pallete.containerColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Pallete.primaryColor,
                                            radius: h * 0.027,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            const AddStaff()),
                                                  );
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.person_add,
                                                  size: h * 0.022,
                                                  color: Pallete.darkColor,
                                                )),
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Text(
                                            'Add',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                          Text(
                                            'Staff',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.1,
                                      width: w * 0.16,
                                      // color: Pallete.containerColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Pallete.primaryColor,
                                            radius: h * 0.027,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            const AddDocument()),
                                                  );
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.arrow_up_doc,
                                                  size: h * 0.022,
                                                  color: Pallete.darkColor,
                                                )),
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Text(
                                            'Add',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                          Text(
                                            'Documents',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.1,
                                      width: w * 0.16,
                                      // color: Pallete.containerColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Pallete.primaryColor,
                                            radius: h * 0.027,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CupertinoIcons.right_chevron,
                                                  size: h * 0.022,
                                                  color: Pallete.darkColor,
                                                )),
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Text(
                                            'View',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                          Text(
                                            'More',
                                            style: TextStyle(
                                                fontSize: h * 0.013,
                                                color: Pallete.darkColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h * 0.05,
                              ),
                              Container(
                                height: h * 0.44,
                                width: w * 0.85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h * 0.03),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Pallete.shadowColor,
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        offset: Offset(0, 0)),
                                  ],
                                  color: Pallete.whiteColor,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: h * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: w * 0.065,
                                        ),
                                        Text(
                                          'FEATURES',
                                          style: TextStyle(
                                              fontSize: h * 0.014,
                                              fontWeight: FontWeight.w600,
                                              color: Pallete.darkColor),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: h * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) =>
                                                                const OfficeStaffScreen()),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.person_2,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Office',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'Staffs',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) =>
                                                                const StaffScreen()),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.person_3,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Staff',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'Details',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) =>
                                                                const DocumentScreen()),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.doc,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Documents',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'Details',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                            builder: (context) =>
                                                                const OrderScreen()),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons.cart,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Order',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'Details',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: h * 0.015,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        CupertinoPageRoute(
                                                          builder: (context) =>
                                                              const AnalysisScreen(),
                                                        ),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons
                                                          .chart_bar_square,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Analytics',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'Details',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      CupertinoIcons.calendar,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Meeting',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'Schedules',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      CupertinoIcons.timer,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Daily',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'Reports',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.1,
                                          width: w * 0.16,
                                          // color: Pallete.containerColor,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Pallete.primaryColor,
                                                radius: h * 0.027,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      CupertinoIcons
                                                          .right_chevron,
                                                      size: h * 0.022,
                                                      color: Pallete.darkColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              Text(
                                                'Explore',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                              Text(
                                                'More',
                                                style: TextStyle(
                                                    fontSize: h * 0.013,
                                                    color: Pallete.darkColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: h * 0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: w * 0.065,
                                        ),
                                        Text(
                                          'USERS',
                                          style: TextStyle(
                                              fontSize: h * 0.014,
                                              fontWeight: FontWeight.w600,
                                              color: Pallete.darkColor),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    SizedBox(
                                      height: h * 0.11,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 4,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: h * 0.02),
                                              child: SizedBox(
                                                height: h * 0.1,
                                                width: w * 0.16,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: h * 0.027,
                                                    ),
                                                    SizedBox(
                                                      height: h * 0.01,
                                                    ),
                                                    Text(
                                                      'Rahul ',
                                                      style: TextStyle(
                                                          fontSize: h * 0.015,
                                                          color: Pallete
                                                              .darkColor),
                                                    ),
                                                    Text(
                                                      'Owner',
                                                      style: TextStyle(
                                                          fontSize: h * 0.01,
                                                          color: Pallete
                                                              .darkColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => ErrorText(error: error.toString()),
              loading: () => const Loader());
        },
      ),
    );
  }
}
