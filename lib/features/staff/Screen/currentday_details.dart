import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';

class CurrentDetailsChange extends StatefulWidget {
  const CurrentDetailsChange({super.key});

  @override
  State<CurrentDetailsChange> createState() => _CurrentDetailsChangeState();
}

class _CurrentDetailsChangeState extends State<CurrentDetailsChange> {
  List<String> _presentStatus = ["Full Day", "Half Day", 'Leave'];
  List<String> _overTime = ["1", "2", "3", "4", "5", "6"];
  String? selectedValue1;
  String? selectedValue2;

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
                        selectedValue1 = value!;
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
                        selectedValue2 = value!;
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
              SizedBox(
                width: w,
                height: h * 0.1,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(w * 0.85, h * 0.06),
                    backgroundColor: Pallete.secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.15))),
                child: Text(
                  "Update Today Status",
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
