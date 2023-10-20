import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/staff/Screen/add_staff.dart';
import 'package:kalpaka_app/features/staff/Screen/view_staff.dart';

import '../../../core/global_variables/global_variables.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.whiteColor,
        appBar: AppBar(
          backgroundColor: Pallete.whiteColor,
          automaticallyImplyLeading: false,
          toolbarHeight: h * 0.08,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'STAFF DETAILS',
            style: TextStyle(fontSize: h * 0.021, color: Pallete.darkColor),
          ),
        ),
        body: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: h * 0.02, left: w * 0.03, right: w * 0.03),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ViewStaff()),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: h * 0.023,
                      foregroundImage: const NetworkImage(
                          'https://rahulrgz.github.io/rahul/assets/img/profile-img.png'),
                    ),
                    title: const Text('Rahul Ramesh'),
                    subtitle: const Text('Status: Full Day'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_outlined)),
                  ),
                ),
              );
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Pallete.whiteColor,
          foregroundColor: Pallete.darkColor,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const AddStaff()),
            );
          },
          icon: Icon(
            CupertinoIcons.add_circled,
            size: h * 0.02,
          ),
          label: Text(
            'ADD STAFF',
            style: TextStyle(fontSize: h * 0.017),
          ),
        ),
      ),
    );
  }
}
