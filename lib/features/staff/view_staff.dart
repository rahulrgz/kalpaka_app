import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';

import '../../core/global_variables/global_variables.dart';

class ViewStaff extends StatefulWidget {
  const ViewStaff({super.key});

  @override
  State<ViewStaff> createState() => _ViewStaffState();
}

class _ViewStaffState extends State<ViewStaff> {
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
          'RAHUL RAMESH',
          style: TextStyle(fontSize: h * 0.017, color: Pallete.darkColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w * 0.05,
                  ),
                  CircleAvatar(
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
                        'RAHUL RAMESH',
                        style: TextStyle(
                            fontSize: h * 0.019, color: Pallete.darkColor),
                      ),
                      Text(
                        '+91 9744930917',
                        style: TextStyle(
                            fontSize: h * 0.015, color: Pallete.darkColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
