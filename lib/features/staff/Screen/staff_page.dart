import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/staff/Screen/add_staff.dart';
import 'package:kalpaka_app/features/staff/Screen/view_staff.dart';
import 'package:kalpaka_app/features/staff/controller/staffController.dart';

import '../../../core/commons/error.dart';
import '../../../core/commons/loader.dart';
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
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ref.watch(getStaffProvider).when(
                data: (staffs) {
                  print(staffs);
                  return ListView.builder(
                      itemCount: staffs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: h * 0.02,
                              left: w * 0.03,
                              right: w * 0.03),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => ViewStaff(
                                    singleStaff: staffs[index],
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: h * 0.03,
                                foregroundImage: NetworkImage(
                                    staffs[index].profile.toString()),
                              ),
                              title: Text(
                                staffs[index].name,
                                style: TextStyle(
                                    fontSize: w * 0.042,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                staffs[index].phone,
                                style: TextStyle(fontSize: w * 0.03),
                              ),
                              // trailing: Icon(
                              //   CupertinoIcons.app_badge,
                              //   size: w * 0.06,
                              // ),
                            ),
                          ),
                        );
                      });
                },
                error: (error, stackTrace) =>
                    ErrorText(error: error.toString()),
                loading: () => const Loader());
          },
        ),
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
