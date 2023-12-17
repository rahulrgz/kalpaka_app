import 'dart:convert';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/staff/Screen/currentday_details.dart';
import 'package:kalpaka_app/features/staff/Screen/staff_report.dart';
import 'package:kalpaka_app/features/staff/controller/staffController.dart';
import 'package:kalpaka_app/model/staffModel.dart';

import '../../../core/commons/error.dart';
import '../../../core/commons/loader.dart';
import '../../../core/commons/utils.dart';
import '../../../core/global_variables/global_variables.dart';

class ViewStaff extends StatefulWidget {
  ViewStaff({super.key, required this.singleStaff});
  StaffModel singleStaff;
  @override
  State<ViewStaff> createState() => _ViewStaffState();
}

class _ViewStaffState extends State<ViewStaff> {
  String? staffId;
  bool _updated = true;
  // void deleteConfirmBoxMobile(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       contentTextStyle: TextStyle(
  //           fontWeight: FontWeight.w500,
  //           color: Pallete.primaryColor,
  //           fontSize: w * 0.04),
  //       actionsAlignment: MainAxisAlignment.center,
  //       backgroundColor: Pallete.secondaryColor,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(w * 0.05)),
  //       actionsPadding: EdgeInsets.only(bottom: h * 0.03),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           SizedBox(height: h * 0.03),
  //           Text('Are you sure you want to ',
  //               style: TextStyle(
  //                   fontSize: h * 0.019,
  //                   color: Pallete.whiteColor,
  //                   fontWeight: FontWeight.bold)),
  //           Text('delete?',
  //               style: TextStyle(
  //                   fontSize: h * 0.019,
  //                   color: Pallete.whiteColor,
  //                   fontWeight: FontWeight.bold)),
  //         ],
  //       ),
  //       actions: [
  //         ElevatedButton(
  //           onPressed: () => Navigator.pop(context),
  //           style: ElevatedButton.styleFrom(
  //             minimumSize: Size(w * 0.23, h * 0.035),
  //             backgroundColor: Pallete.secondaryColor,
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(h * 0.008),
  //                 side: const BorderSide(color: Pallete.primaryColor)),
  //           ),
  //           child: Text(
  //             'Cancel',
  //             style: TextStyle(
  //                 fontSize: w * 0.037,
  //                 fontWeight: FontWeight.bold,
  //                 color: Pallete.primaryColor),
  //           ),
  //         ),
  //         ElevatedButton(
  //           onPressed: () {},
  //           style: ElevatedButton.styleFrom(
  //             minimumSize: Size(w * 0.23, h * 0.035),
  //             backgroundColor: Pallete.primaryColor,
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(h * 0.008),
  //                 side: const BorderSide(color: Pallete.secondaryColor)),
  //           ),
  //           child: Text(
  //             'Delete',
  //             style: TextStyle(
  //                 fontSize: w * 0.037,
  //                 fontWeight: FontWeight.bold,
  //                 color: Pallete.secondaryColor),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    staffId = widget.singleStaff.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        // centerTitle: true,
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: w * 0.05,
                  ),
                  CircleAvatar(
                    radius: h * 0.025,
                    foregroundImage:
                        NetworkImage(widget.singleStaff.profile.toString()),
                  ),
                  SizedBox(
                    width: w * 0.025,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.singleStaff.name,
                        style: TextStyle(
                            fontSize: h * 0.02,
                            color: Pallete.darkColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.singleStaff.phone,
                        style: TextStyle(
                            fontSize: h * 0.015, color: Pallete.darkColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => StaffReportScreen(
                            staffId: staffId.toString(),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.doc_chart,
                      size: h * 0.03,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: h * 0.03,
                  right: h * 0.01,
                  left: h * 0.01,
                  bottom: h * 0.03),
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return SizedBox(
                    child: EasyDateTimeLine(
                      initialDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        //`selectedDate` the new date selected.
                        ("/////");
                        print(selectedDate);
                        DateTime _datePicked1 = DateTime(selectedDate.year,
                            selectedDate.month, selectedDate.day, 0, 0, 0);

                        ref
                            .read(selectedDateProvider.notifier)
                            .update((state) => _datePicked1);
                      },
                      activeColor: const Color(0xffFFBF9B),
                      headerProps: const EasyHeaderProps(
                        selectedDateFormat: SelectedDateFormat.monthOnly,
                      ),
                      dayProps: EasyDayProps(
                        height: h * 0.067,
                        width: h * 0.067,
                        dayStructure: DayStructure.dayNumDayStr,
                        inactiveDayStyle: DayStyle(
                          borderRadius: h * 0.05,
                          dayNumStyle: TextStyle(
                            fontSize: h * 0.02,
                          ),
                        ),
                        activeDayStyle: DayStyle(
                          borderRadius: h * 0.05,
                          dayNumStyle: TextStyle(
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              'ATTENDANCE',
              style: TextStyle(
                  fontSize: h * 0.025,
                  color: Pallete.darkColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                DateTime now = DateTime.now();
                var datePicked1 =
                    DateTime(now.year, now.month, now.day, 0, 0, 0);
                DateTime? d = ref.watch(selectedDateProvider) ?? datePicked1;

                Map _temp = {
                  "date": d?.toIso8601String(),
                  "staffId": staffId.toString(),
                };
                String encode = jsonEncode(_temp);
                return ref.watch(getStaffAttendenceProvider(encode)).when(
                    data: (attendence) {
                      print("aten");
                      print(attendence);
                      return attendence.isEmpty
                          ? Text("No data updated")
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                              offset: Offset(1, 1))
                                        ],
                                        color: Pallete.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(h * 0.02),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(h * 0.02),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Status :',
                                              style: TextStyle(
                                                  fontSize: h * 0.015,
                                                  color: Pallete.darkColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: h * 0.01,
                                            ),
                                            Center(
                                              child: Text(
                                                attendence[0].attendence,
                                                style: TextStyle(
                                                  fontSize: h * 0.02,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: w * 0.4,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                              offset: Offset(1, 2))
                                        ],
                                        color: Pallete.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(h * 0.02),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(h * 0.02),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'OverTime:',
                                              style: TextStyle(
                                                  fontSize: h * 0.015,
                                                  color: Pallete.darkColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: h * 0.01,
                                            ),
                                            Center(
                                              child: Text(
                                                attendence[0].overtime,
                                                style: TextStyle(
                                                    fontSize: h * 0.02,
                                                    color: Pallete.darkColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.037),
                                Container(
                                  width: w * 0.4,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                          offset: Offset(1, 2))
                                    ],
                                    color: Pallete.whiteColor,
                                    borderRadius:
                                        BorderRadius.circular(h * 0.02),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(h * 0.02),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Amount Paid:',
                                          style: TextStyle(
                                              fontSize: h * 0.015,
                                              color: Pallete.darkColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Center(
                                          child: Text(
                                            "₹ ${attendence[0].amt}",
                                            style: TextStyle(
                                                fontSize: h * 0.03,
                                                color: Pallete.darkColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                    },
                    error: (error, stackTrace) =>
                        ErrorText(error: error.toString()),
                    loading: () => const Loader());
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          DateTime now = DateTime.now();
          var datePicked1 = DateTime(now.year, now.month, now.day, 0, 0, 0);
          DateTime? d1 = ref.watch(selectedDateProvider) ?? datePicked1;

          Map _temp = {
            "date": d1?.toIso8601String(),
            "staffId": staffId.toString(),
          };
          String encode = jsonEncode(_temp);
          return ref.watch(getStaffAttendenceProvider(encode)).when(
              data: (attendence) {
                print("aten");
                DateTime now = DateTime.now();
                DateTime formattedDate =
                    DateTime(now.year, now.month, now.day, 0, 0, 0);

                return formattedDate == ref.watch(selectedDateProvider) ||
                        ref.watch(selectedDateProvider)!.isBefore(formattedDate)
                    ? FloatingActionButton.extended(
                        backgroundColor: Pallete.darkColor,
                        foregroundColor: Pallete.whiteColor,
                        onPressed: () {
                          if (ref.read(selectedDateProvider) == formattedDate ||
                              ref
                                  .read(selectedDateProvider)!
                                  .isBefore(formattedDate)) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CurrentDetailsChange(
                                  staffId: widget.singleStaff.uid,
                                  amt: attendence.isNotEmpty
                                      ? attendence[0].amt
                                      : null,
                                  overtime: attendence.isNotEmpty
                                      ? attendence[0].overtime
                                      : null,
                                  a: attendence.isNotEmpty
                                      ? attendence[0].attendence
                                      : null,
                                  data: attendence.isNotEmpty
                                      ? attendence[0]
                                      : null,
                                  date: ref.read(selectedDateProvider),
                                ),
                              ),
                            );
                          }
                          // else if () {
                          //   Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //       builder: (context) => CurrentDetailsChange(
                          //         staffId: widget.singleStaff.uid,
                          //         amt: attendence.isNotEmpty
                          //             ? attendence[0].amt
                          //             : null,
                          //         overtime: attendence.isNotEmpty
                          //             ? attendence[0].overtime
                          //             : null,
                          //         a: attendence.isNotEmpty
                          //             ? attendence[0].attendence
                          //             : null,
                          //         data: attendence.isNotEmpty
                          //             ? attendence[0]
                          //             : null,
                          //       ),
                          //     ),
                          //   );
                          // }
                          else {
                            showSnackBar(
                                context: context,
                                content: "Status Updated Successfully");
                          }
                        },
                        icon: Icon(
                          CupertinoIcons.time,
                          size: h * 0.02,
                        ),
                        label: attendence.isEmpty
                            ? Text(
                                'Update Today Status',
                                style: TextStyle(fontSize: h * 0.017),
                              )
                            : Text(
                                'Edit Status',
                                style: TextStyle(fontSize: h * 0.017),
                              ),
                      )
                    : Text("No data updated");
              },
              error: (error, stackTrace) => ErrorText(error: error.toString()),
              loading: () => const Loader());
        },
      ),
    );
  }
}
