import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/features/document/add_document.dart';

import '../../core/global_variables/global_variables.dart';
import '../../core/theme/pallete.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: h * 0.08,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'DOCUMENTS',
          style: TextStyle(fontSize: h * 0.021, color: Pallete.darkColor),
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.25,
            crossAxisCount: 2,
          ),
          itemCount: 42,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(h * 0.01),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.02),
                ),
                color: Pallete.containerColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: h * 0.07,
                        width: w * 0.16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(h * 0.015),
                        ),
                        child: const Icon(CupertinoIcons.doc_text_fill),
                      ),
                      Text(
                        'DASH DOCUMENTS',
                        style: TextStyle(fontSize: h * 0.016),
                      ),
                      Text(
                        'Date: 17 Sep 2023',
                        style: TextStyle(fontSize: h * 0.012),
                      ),
                      Container(
                        height: h * 0.04,
                        width: w * 0.3,
                        decoration: BoxDecoration(
                          color: Pallete.secondaryColor,
                          borderRadius: BorderRadius.circular(h * 0.01),
                        ),
                        child: Center(
                            child: Text(
                          'Download',
                          style: TextStyle(
                              fontSize: h * 0.015,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Pallete.whiteColor,
        foregroundColor: Pallete.darkColor,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const AddDocument()),
          );
        },
        icon: Icon(
          CupertinoIcons.add_circled,
          size: h * 0.02,
        ),
        label: Text(
          'ADD DOCUMENT',
          style: TextStyle(fontSize: h * 0.017),
        ),
      ),
    );
  }
}
