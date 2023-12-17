import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalpaka_app/model/attendenceOfStaff.dart';

import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import '../controller/staffController.dart';

class CurrentDetailsChange extends ConsumerStatefulWidget {
  CurrentDetailsChange(
      {super.key,
      required this.staffId,
      required this.amt,
      required this.overtime,
      required this.a,
      required this.data,
      required this.date});
  StaffAttendence? data;
  DateTime? date;
  String? amt;
  String? overtime;
  String? a;

  String staffId;

  @override
  ConsumerState<CurrentDetailsChange> createState() =>
      _CurrentDetailsChangeState();
}

class _CurrentDetailsChangeState extends ConsumerState<CurrentDetailsChange> {
  List<String> _presentStatus = ["Full Day", "Half Day", "Leave"];
  List<String> _overTime = ["0", "1", "2", "3", "4", "5", "6"];
  String? selectedValue1;
  String? selectedValue2;
  TextEditingController amtContoller = TextEditingController();
  currentdayStatus(
      {required String attendence,
      required String overTime,
      required String amt,
      required BuildContext context}) {
    ref.read(staffControllerProvider.notifier).addCurrendayStatus(
        stafDailyAttendence: attendence,
        overtime: overTime,
        staffId: widget.staffId,
        context: context,
        amt: amt,
        date: widget.date ?? DateTime.now());
  }

  editCurrendayStatus(
      {required String attendence,
      required String overTime,
      required String amt,
      required BuildContext context}) {
    ref.read(staffControllerProvider.notifier).editCurrendayStatus(
        attendence: attendence,
        overTime: overTime,
        amt: amt,
        data: widget.data!,
        context: context);
  }

  editOrUpdateCheck() {
    if (widget.overtime != null && widget.a != null) {
      updateOrEditCheck = true;
    } else {
      updateOrEditCheck = false;
    }
  }

  bool updateOrEditCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editOrUpdateCheck();
    amtContoller = TextEditingController(
        text: widget.amt != null ? widget.amt.toString() : '');
    selectedValue1 = _presentStatus.contains(widget.a.toString())
        ? widget.a.toString()
        : "Full Day";
    selectedValue2 = _overTime.contains(widget.overtime.toString())
        ? widget.overtime.toString()
        : "0";

    print("staffId");
    print(widget.overtime);
  }

  @override
  Widget build(BuildContext context) {
    print("jd");
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
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.03, right: w * 0.03),
          child: Column(
            children: [
              SizedBox(height: h * 0.05),
              SizedBox(
                width: w,
                height: h * 0.065,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Attendance',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w400,
                          color: Pallete.secondaryColor,
                          fontSize: w * 0.035),
                      //    TextStyle(

                      //     fontSize: 14,
                      //     color: Theme.of(context).hintColor,
                      //   ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    )),
                    items: _presentStatus
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.urbanist(
                                  color: Pallete.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.035,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue1,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue1 = value!; //attendence
                      });
                      // // ref
                      // //     .read(selectedValue.notifier)
                      // //     .update((state) => value!);
                      // value = value!;
                    },
                    buttonStyleData: ButtonStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Pallete.secondaryColor),
                        color: Pallete.whiteColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              SizedBox(
                width: w,
                height: h * 0.065,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Over Time',
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w400,
                          color: Pallete.secondaryColor,
                          fontSize: w * 0.035),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: _overTime
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.urbanist(
                                  color: Pallete.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.035,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue2,
                    onChanged: (String? value) {
                      setState(() {
                        print("///");
                        selectedValue2 = value!; //overtime
                      });
                      // // ref
                      // //     .read(selectedValue.notifier)
                      // //     .update((state) => value!);
                      // value = value!;
                    },
                    buttonStyleData: ButtonStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Pallete.secondaryColor),
                        color: Pallete.whiteColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              SizedBox(
                width: w,
                height: h * 0.065,
                child: TextFormField(
                  controller: amtContoller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Pallete.secondaryColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Pallete.secondaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Pallete.secondaryColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Pallete.secondaryColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    hintText: 'Amount Paid',
                    hintStyle: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w400,
                        color: Pallete.secondaryColor,
                        fontSize: w * 0.035),
                  ),
                ),
              ),
              SizedBox(
                width: w,
                height: h * 0.1,
              ),
              ElevatedButton(
                onPressed: () {
                  if (updateOrEditCheck != true) {
                    currentdayStatus(
                      attendence: selectedValue1.toString(),
                      overTime: selectedValue2.toString(),
                      context: context,
                      amt: amtContoller.text.trim(),
                    );
                  } else {
                    editCurrendayStatus(
                        attendence: selectedValue1.toString(),
                        overTime: selectedValue2.toString(),
                        context: context,
                        amt: amtContoller.text.trim());
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(w * 0.85, h * 0.06),
                    backgroundColor: Pallete.secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.15))),
                child: Text(
                  updateOrEditCheck != true
                      ? "Update Today Status"
                      : "Edit Status",
                  style: GoogleFonts.urbanist(
                      fontSize: h * 0.017,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
