import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalpaka_app/core/global_variables/global_variables.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/staff/controller/staffController.dart';

import '../../../core/commons/error.dart';

class StaffReportScreen extends StatefulWidget {
  StaffReportScreen({super.key, required this.staffId});
  String staffId;
  @override
  State<StaffReportScreen> createState() => _StaffReportScreenState();
}

class _StaffReportScreenState extends State<StaffReportScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Staff Report',
            style: TextStyle(
                fontSize: h * 0.027,
                color: Pallete.darkColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ref
                  .watch(getStaffReportProvider(widget.staffId.toString()))
                  .when(
                      data: (attendenceReport) {
                        return DataTable(
                            columnSpacing: w * 0.1,
                            columns: [
                              DataColumn(
                                label: Text(
                                  'Date',
                                  style: TextStyle(
                                      fontSize: h * 0.018,
                                      color: Pallete.darkColor),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Attendance',
                                  style: TextStyle(
                                      fontSize: h * 0.018,
                                      color: Pallete.darkColor),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'OverTime',
                                  style: TextStyle(
                                      fontSize: h * 0.018,
                                      color: Pallete.darkColor),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Amount',
                                  style: TextStyle(
                                      fontSize: h * 0.018,
                                      color: Pallete.darkColor),
                                ),
                              ),
                            ],
                            rows:
                                List.generate(attendenceReport.length, (index) {
                              final String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(
                                      attendenceReport[index].uploadDate);

                              return DataRow(cells: [
                                DataCell(Text(formattedDate.toString())),
                                DataCell(Text(attendenceReport[index]
                                    .attendence
                                    .toString())),
                                DataCell(Text(attendenceReport[index]
                                    .overtime
                                    .toString())),
                                DataCell(Text(
                                    attendenceReport[index].amt.toString())),
                              ]);
                            }));
                      },
                      error: (error, stackTrace) =>
                          ErrorText(error: error.toString()),
                      loading: () => const Text(''));
            },
          ),
        ),
      ),
    );
  }
}
