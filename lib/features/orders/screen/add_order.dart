import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';

import '../../../core/global_variables/global_variables.dart';
import '../controller/oredercontroller.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  TextEditingController cname = TextEditingController();
  TextEditingController vmodel = TextEditingController();
  TextEditingController enumber = TextEditingController();
  TextEditingController cnumber = TextEditingController();
  TextEditingController phnumber = TextEditingController();
  TextEditingController adddetails = TextEditingController();
  TextEditingController vNumber = TextEditingController();
  void addOrder(
      {required String cname,
      required String vmodel,
      required String enumber,
      required String cnumber,
      required String phnumber,
      required String adddetails,
      required String img,
      required BuildContext ctx,
      required String vnumber,
      required WidgetRef ref}) {
    ref.read(orderControllerProvider.notifier).addOrder(
        cname: cname,
        vmodel: vmodel,
        enumber: enumber,
        cnumber: cnumber,
        phnumber: phnumber,
        adddetails: adddetails,
        img: img,
        ctx: context,
        vNumber: vnumber);
  }

  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  String? _pickedImagePath;
  Future<String> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      firebase_storage.Reference firebaseStorageRef =
          firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      firebase_storage.UploadTask uploadTask =
          firebaseStorageRef.putFile(imageFile);
      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  Future<void> _pickImagecam() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      String downloadUrl = await uploadImageToFirebase(file);

      setState(() {
        _pickedImage = pickedFile;
        _pickedImagePath = downloadUrl;
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
      File file = File(pickedFile.path);
      String downloadUrl = await uploadImageToFirebase(file);

      setState(() {
        _pickedImage = pickedFile;
        _pickedImagePath = downloadUrl;
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
          'ADD ORDER',
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
                  height: h * 0.01,
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
                        controller: cname,
                        decoration: InputDecoration(
                            hintText: 'Customer Name',
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
                        controller: phnumber,
                        decoration: InputDecoration(
                            hintText: 'Customer Number',
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
                        controller: vmodel,
                        decoration: InputDecoration(
                            hintText: 'Vehicle Model',
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
                        controller: vNumber,
                        decoration: InputDecoration(
                            hintText: 'Vehicle NUmber',
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
                        controller: enumber,
                        decoration: InputDecoration(
                            hintText: 'Engine Number',
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
                        controller: cnumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Chase Number',
                            hintStyle: TextStyle(fontSize: h * 0.02),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: w * 0.55,
                        height: h * 0.19,
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
                          padding:
                              EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                          child: TextFormField(
                            controller: adddetails,
                            maxLines: 3,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Additional Details',
                                hintStyle: TextStyle(fontSize: h * 0.02),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ),
                      Container(
                        width: w * 0.3,
                        height: h * 0.19,
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
                        child: _pickedImage != null
                            ? Image.file(
                                File(_pickedImage!.path),
                                fit: BoxFit.cover,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                      color:
                                                          Pallete.darkColor)),
                                              onTap: _pickImagecam,
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                CupertinoIcons
                                                    .photo_on_rectangle,
                                                size: h * 0.026,
                                              ),
                                              title: Text('Gallery',
                                                  style: TextStyle(
                                                      fontSize: h * 0.017,
                                                      color:
                                                          Pallete.darkColor)),
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return FloatingActionButton.extended(
            backgroundColor: Colors.grey.shade700,
            foregroundColor: Pallete.whiteColor,
            onPressed: () {
              addOrder(
                  cname: cname.text.trim(),
                  vmodel: vmodel.text.trim(),
                  enumber: enumber.text.trim(),
                  cnumber: cnumber.text.trim(),
                  phnumber: phnumber.text.trim(),
                  adddetails: adddetails.text.trim(),
                  img: _pickedImagePath.toString(),
                  ref: ref,
                  ctx: context,
                  vnumber: vNumber.text.trim());
            },
            label: Text(
              'Confirm Order',
              style: TextStyle(fontSize: h * 0.017),
            ),
          );
        },
      ),
    );
  }
}
