import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalpaka_app/core/global_variables/global_variables.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';

class StaffReportScreen extends StatefulWidget {
  const StaffReportScreen({super.key});

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
          child: DataTable(
            columnSpacing: w * 0.1,
            columns: [
              DataColumn(
                label: Text(
                  'Date',
                  style:
                      TextStyle(fontSize: h * 0.021, color: Pallete.darkColor),
                ),
              ),
              DataColumn(
                label: Text(
                  'Attendance',
                  style:
                      TextStyle(fontSize: h * 0.02, color: Pallete.darkColor),
                ),
              ),
              DataColumn(
                label: Text(
                  'OverTime',
                  style:
                      TextStyle(fontSize: h * 0.02, color: Pallete.darkColor),
                ),
              ),
              DataColumn(
                label: Text(
                  'Amount',
                  style:
                      TextStyle(fontSize: h * 0.02, color: Pallete.darkColor),
                ),
              ),
            ],
            rows: [
              DataRow(cells: [
                DataCell(
                  Text(
                      DateFormat("MMM dd").format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text(
                    'Leave',
                    style:
                        TextStyle(fontSize: h * 0.02, color: Pallete.darkColor),
                  ),
                ),
                DataCell(
                  Text('0h',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text('2500',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text(
                      DateFormat("MMM dd").format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text(
                    'Half Day',
                    style:
                        TextStyle(fontSize: h * 0.02, color: Pallete.darkColor),
                  ),
                ),
                DataCell(
                  Text('0h',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text('2500',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text(
                      DateFormat("MMM dd").format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text(
                    'Full Day',
                    style:
                        TextStyle(fontSize: h * 0.02, color: Pallete.darkColor),
                  ),
                ),
                DataCell(
                  Text('2h',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text('2500',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
              ]),
              DataRow(cells: [
                DataCell(
                  Text(
                      DateFormat("MMM dd").format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text(
                    'Full Day',
                    style:
                        TextStyle(fontSize: h * 0.02, color: Pallete.darkColor),
                  ),
                ),
                DataCell(
                  Text('0h',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
                DataCell(
                  Text('2500',
                      style: TextStyle(
                          fontSize: h * 0.02, color: Pallete.darkColor)),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
