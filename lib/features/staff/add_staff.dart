import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/global_variables/global_variables.dart';
import '../../core/theme/pallete.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController salary = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;

  Future<void> _pickImagecam() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cancelled'),
        ),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _pickImagegal() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cancelled'),
        ),
      );
      Navigator.pop(context);
    }
  }

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
          'ADD STAFF',
          style: TextStyle(fontSize: h * 0.017, color: Pallete.darkColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.only(left: h * 0.03, right: h * 0.03, top: h * 0.01),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.02,
                ),
                CircleAvatar(
                  radius: h * 0.08,
                  backgroundColor: Pallete.containerColor,
                  child: _pickedImage != null
                      ? ClipOval(
                          child: Image.file(
                            File(_pickedImage!.path),
                            width: h * 0.16,
                            height: h * 0.16,
                            fit: BoxFit.cover,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              showDragHandle: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(h * 0.05),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(
                                          CupertinoIcons.camera,
                                          size: h * 0.026,
                                        ),
                                        title: Text('Camera',
                                            style: TextStyle(
                                                fontSize: h * 0.017,
                                                color: Pallete.darkColor)),
                                        onTap: _pickImagecam,
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          CupertinoIcons.photo_on_rectangle,
                                          size: h * 0.026,
                                        ),
                                        title: Text('Gallery',
                                            style: TextStyle(
                                                fontSize: h * 0.017,
                                                color: Pallete.darkColor)),
                                        onTap: _pickImagegal,
                                      ),
                                      SizedBox(
                                        height: h * 0.02,
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            CupertinoIcons.add_circled,
                            color: Pallete.darkColor,
                            size: h * 0.04,
                          ),
                        ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.015),
                  child: Container(
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Pallete.shadowColor,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 0)),
                      ],
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(h * 0.02),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(fontSize: h * 0.02),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.02),
                  child: Container(
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Pallete.shadowColor,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 0)),
                      ],
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(h * 0.02),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                      child: TextFormField(
                        controller: number,
                        decoration: InputDecoration(
                            hintText: 'Enter Number',
                            hintStyle: TextStyle(fontSize: h * 0.02),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.02),
                  child: Container(
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Pallete.shadowColor,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 0)),
                      ],
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(h * 0.02),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                      child: TextFormField(
                        controller: age,
                        decoration: InputDecoration(
                            hintText: 'Enter Age',
                            hintStyle: TextStyle(fontSize: h * 0.02),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.02),
                  child: Container(
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Pallete.shadowColor,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 0)),
                      ],
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(h * 0.02),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                      child: TextFormField(
                        controller: place,
                        decoration: InputDecoration(
                            hintText: 'Enter Place',
                            hintStyle: TextStyle(fontSize: h * 0.02),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.02),
                  child: Container(
                    height: h * 0.06,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Pallete.shadowColor,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(0, 0)),
                      ],
                      color: Pallete.whiteColor,
                      borderRadius: BorderRadius.circular(h * 0.02),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                      child: TextFormField(
                        controller: salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter Salary',
                            hintStyle: TextStyle(fontSize: h * 0.02),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey.shade700,
        foregroundColor: Pallete.whiteColor,
        onPressed: () {},
        label: Text(
          'Add Staff',
          style: TextStyle(fontSize: h * 0.017),
        ),
      ),
    );
  }
}
