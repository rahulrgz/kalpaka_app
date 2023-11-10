import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:kalpaka_app/features/document/controller/documentController.dart';
import 'package:kalpaka_app/features/document/screen/add_document.dart';

import '../../../core/commons/error.dart';
import '../../../core/commons/loader.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  void Download() async {
    var time = DateTime.now().millisecondsSinceEpoch;
    var path = "/storage/emulated/0/Download/image-$time.jpg";
    var file = File(path);
    var res = await get(Uri.parse("https://source.unsplash.com/random"));
    file.writeAsBytes(res.bodyBytes);
  }

  void downloadDoc({required String imageUrl}) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        var time = DateTime.now().millisecondsSinceEpoch;
        var path = "/storage/emulated/0/Download/image-$time.jpg";
        final appDocDir = await getApplicationDocumentsDirectory();
        final file = File(path);
        await file.writeAsBytes(response.bodyBytes, flush: true);

        print('Image saved to: ${file.path}');
      } else {
        print('Failed to download image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading and saving image: $e');
    }
  }

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
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ref.watch(getDocumentsProvider).when(
              data: (doc) {
                return doc.isEmpty
                    ? const Center(child: Text(("No Data")))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.25,
                          crossAxisCount: 2,
                        ),
                        itemCount: doc.length,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: h * 0.07,
                                      width: w * 0.16,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(h * 0.015),
                                      ),
                                      child: const Icon(
                                          CupertinoIcons.doc_text_fill),
                                    ),
                                    Text(
                                      doc[index].description,
                                      style: TextStyle(fontSize: h * 0.016),
                                    ),
                                    Text(
                                      doc[index].uploadDate.toString(),
                                      style: TextStyle(fontSize: h * 0.012),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        downloadDoc(
                                            imageUrl:
                                                doc[index].doc.toString());
                                      },
                                      child: Container(
                                        height: h * 0.04,
                                        width: w * 0.3,
                                        decoration: BoxDecoration(
                                          color: Pallete.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(h * 0.01),
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
              },
              error: (error, stackTrace) => ErrorText(error: error.toString()),
              loading: () => const Loader());
        },
      ),
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
