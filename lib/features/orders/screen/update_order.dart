import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';

class UpdateOrder extends StatefulWidget {
  const UpdateOrder({super.key});

  @override
  State<UpdateOrder> createState() => _UpdateOrderState();
}

class _UpdateOrderState extends State<UpdateOrder> {
  String? selectedValue3;
  File? _image;
  TextEditingController _descriptionController = TextEditingController();
  List<String> workStage = ["Work in Progress", "Completed"];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(w * 0.07),
            ),
            minimumSize: Size(w * 0.9, h * 0.06),
            backgroundColor: Colors.purple),
        onPressed: () {},
        child: Text(
          'Update Now',
          style: GoogleFonts.urbanist(
            textStyle: TextStyle(
              fontSize: h * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
            color: Pallete.blackColor,
            size: h * 0.025,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(w * 0.04, h * 0.03, w * 0.05, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: h * 0.4,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(w * 0.05),
                    border: Border.all(color: Pallete.secondaryColor),
                  ),
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.cover)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: h * 0.03,
                            ),
                            Text(
                              'Pick Image from Gallery',
                              style: GoogleFonts.urbanist(
                                textStyle: TextStyle(
                                  fontSize: h * 0.015,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
              SizedBox(height: h * 0.03),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Pallete.secondaryColor),
                    borderRadius: BorderRadius.circular(w * 0.05),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.secondaryColor),
                    borderRadius: BorderRadius.circular(w * 0.05),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.secondaryColor),
                    borderRadius: BorderRadius.circular(w * 0.05),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.secondaryColor),
                    borderRadius: BorderRadius.circular(w * 0.05),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.secondaryColor),
                    borderRadius: BorderRadius.circular(w * 0.05),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Pallete.secondaryColor),
                    borderRadius: BorderRadius.circular(w * 0.05),
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
                      'Stage of Work',
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
                    items: workStage
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
                    value: selectedValue3,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue3 = value!;
                      });
                      // // ref
                      // //     .read(selectedValue.notifier)
                      // //     .update((state) => value!);
                      // value = value!;
                    },
                    buttonStyleData: ButtonStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w * 0.04),
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
            ],
          ),
        ),
      ),
    );
  }
}
