import 'package:easy_date_timeline/easy_date_timeline.dart';
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
  void deleteConfirmBoxMobile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Pallete.primaryColor,
            fontSize: w * 0.04),
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: Pallete.secondaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(w * 0.05)),
        actionsPadding: EdgeInsets.only(bottom: h * 0.03),
        content: SizedBox(
          height: h * 0.05,
          width: w * 0.3,
          child: Column(
            children: [
              Text('Are you sure you want to ',
                  style: TextStyle(
                      fontSize: h * 0.019,
                      color: Pallete.whiteColor,
                      fontWeight: FontWeight.bold)),
              Text('delete?',
                  style: TextStyle(
                      fontSize: h * 0.019,
                      color: Pallete.whiteColor,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(w * 0.23, h * 0.035),
              backgroundColor: Pallete.secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.008),
                  side: const BorderSide(color: Pallete.primaryColor)),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                  fontSize: w * 0.037,
                  fontWeight: FontWeight.bold,
                  color: Pallete.primaryColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(w * 0.23, h * 0.035),
              backgroundColor: Pallete.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.008),
                  side: const BorderSide(color: Pallete.secondaryColor)),
            ),
            child: Text(
              'Delete',
              style: TextStyle(
                  fontSize: w * 0.037,
                  fontWeight: FontWeight.bold,
                  color: Pallete.secondaryColor),
            ),
          ),
        ],
      ),
    );
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
        physics: const BouncingScrollPhysics(),
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
                  ),
                  SizedBox(
                    width: w * 0.025,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RAHUL RAMESH',
                        style: TextStyle(
                            fontSize: h * 0.02,
                            color: Pallete.darkColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '+91 9744930917',
                        style: TextStyle(
                            fontSize: h * 0.015, color: Pallete.darkColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        deleteConfirmBoxMobile(context);
                      },
                      icon: Icon(
                        CupertinoIcons.delete,
                        size: h * 0.023,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: h * 0.03,
                  right: h * 0.01,
                  left: h * 0.01,
                  bottom: h * 0.03),
              child: SizedBox(
                child: EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    //`selectedDate` the new date selected.
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: h * 0.1,
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
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(h * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Leave',
                            style: TextStyle(
                              fontSize: h * 0.02,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: h * 0.1,
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
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(h * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            '0',
                            style: TextStyle(
                                fontSize: h * 0.02, color: Pallete.darkColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.037,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: h * 0.1,
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
                    borderRadius: BorderRadius.circular(h * 0.02),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(h * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Days:',
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
                            '24',
                            style: TextStyle(
                                fontSize: h * 0.02, color: Pallete.darkColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: h * 0.1,
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
                      borderRadius: BorderRadius.circular(h * 0.02)),
                  child: Padding(
                    padding: EdgeInsets.all(h * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Credit:',
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
                            '24000',
                            style: TextStyle(
                                fontSize: h * 0.02, color: Pallete.darkColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Pallete.darkColor,
        foregroundColor: Pallete.whiteColor,
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.time,
          size: h * 0.02,
        ),
        label: Text(
          'Update Today Status',
          style: TextStyle(fontSize: h * 0.017),
        ),
      ),
    );
  }
}
