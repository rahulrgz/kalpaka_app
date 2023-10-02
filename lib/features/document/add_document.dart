import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/global_variables/global_variables.dart';
import '../../core/theme/pallete.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({super.key});

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  PlatformFile? selectedFile;
  TextEditingController description = TextEditingController();

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null) {
        setState(() {
          selectedFile = result.files.first;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cancelled'),
          ),
        );
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
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
          'ADD DOCUMENTS',
          style: TextStyle(fontSize: h * 0.017, color: Pallete.darkColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.only(left: h * 0.03, right: h * 0.03, top: h * 0.01),
          child: Column(
            children: [
              Container(
                height: h * 0.4,
                width: w,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Pallete.shadowColor,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0, 0)),
                  ],
                  color: Pallete.whiteColor,
                  borderRadius: BorderRadius.circular(h * 0.03),
                ),
                child: selectedFile != null
                    ? selectedFile!.name.endsWith('.jpg') ||
                            selectedFile!.name.endsWith('.jpeg') ||
                            selectedFile!.name.endsWith('.png')
                        ? Image.file(
                            File(selectedFile?.path ?? ''),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.doc_checkmark,
                                size: h * 0.045,
                                color: Pallete.darkColor,
                              ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              Text(
                                'File Name: ${selectedFile!.name}',
                                style: TextStyle(
                                  fontSize: h * 0.02,
                                  color: Pallete.darkColor,
                                ),
                              ),
                              Text(
                                'File Size: ${selectedFile!.size} bytes',
                                style: TextStyle(
                                  fontSize: h * 0.02,
                                  color: Pallete.darkColor,
                                ),
                              ),
                            ],
                          )
                    : IconButton(
                        onPressed: () {
                          pickFile();
                        },
                        icon: Icon(
                          Icons.upload_file,
                          size: h * 0.05,
                          color: Pallete.darkColor,
                        ),
                      ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Container(
                height: h * 0.15,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Pallete.shadowColor,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(0, 0)),
                  ],
                  color: Pallete.whiteColor,
                  borderRadius: BorderRadius.circular(h * 0.03),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: h * 0.02, right: h * 0.02),
                  child: TextFormField(
                    controller: description,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(fontSize: h * 0.02),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey.shade700,
        foregroundColor: Pallete.whiteColor,
        onPressed: () {},
        label: Text(
          'Upload File',
          style: TextStyle(fontSize: h * 0.017),
        ),
      ),
    );
  }
}
