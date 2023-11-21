import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/orders/screen/update_order.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

import '../../../core/global_variables/global_variables.dart';
import '../../../model/orderModel.dart';

class ViewOrderScreen extends StatefulWidget {
  ViewOrderScreen({super.key, required this.singleOrder});
  OrderModel singleOrder;
  @override
  State<ViewOrderScreen> createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {
  static const _images = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
    'https://i.pravatar.cc/150?img=5',
  ];

  void deleteConfirmBoxMobile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Pallete.primaryColor,
            fontSize: w * 0.04),
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: Pallete.secondaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(w * 0.05)),
        actionsPadding: EdgeInsets.only(bottom: h * 0.03),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: h * 0.03),
            Text('Are you sure you want to ',
                style: TextStyle(
                    fontSize: h * 0.019,
                    color: Pallete.whiteColor,
                    fontWeight: FontWeight.bold)),
            Text('delete?',
                style: TextStyle(
                    fontSize: h * 0.019,
                    color: Pallete.whiteColor,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(w * 0.23, h * 0.035),
              backgroundColor: Pallete.secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.008),
                  side: const BorderSide(color: Pallete.primaryColor)),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                  fontSize: w * 0.037,
                  fontWeight: FontWeight.bold,
                  color: Pallete.primaryColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(w * 0.23, h * 0.035),
              backgroundColor: Pallete.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.008),
                  side: const BorderSide(color: Pallete.secondaryColor)),
            ),
            child: Text(
              'Delete',
              style: TextStyle(
                  fontSize: w * 0.037,
                  fontWeight: FontWeight.bold,
                  color: Pallete.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }

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
            color: Pallete.blackColor,
            size: h * 0.025,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => UpdateOrder(),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.pencil_ellipsis_rectangle,
              size: h * 0.025,
              color: Pallete.blackColor,
            ),
          ),
          IconButton(
            onPressed: () {
              deleteConfirmBoxMobile(context);
            },
            icon: Icon(
              CupertinoIcons.delete,
              size: h * 0.025,
              color: Pallete.blackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.4,
              width: w,
              color: Pallete.containerColor,
              child: Stack(
                children: [
                  ScrollPageView(
                    delay: const Duration(seconds: 6),
                    controller: ScrollPageController(),
                    allowImplicitScrolling: false,
                    clipBehavior: Clip.none,
                    reverse: false,
                    indicatorColor: Colors.transparent,
                    checkedIndicatorColor: Colors.transparent,
                    children:
                        _images.map((image) => _imageView(image)).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: w * 0.05),
                      Container(
                        height: h * 0.15,
                        width: h * 0.15,
                        color: Colors.red,
                        child: Image.network(
                          widget.singleOrder.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.singleOrder.vModel.toString(),
                            style: TextStyle(
                                fontSize: h * 0.024,
                                color: Pallete.darkColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Work in progress',
                            style: TextStyle(
                              fontSize: h * 0.012,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'Customer: ${widget.singleOrder.customerName.toString()}',
                            style: TextStyle(
                              fontSize: h * 0.015,
                              color: Pallete.darkColor,
                            ),
                          ),
                          SizedBox(height: w * 0.02),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.045),
            Padding(
              padding: EdgeInsets.fromLTRB(w * 0.05, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Name :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.customerName.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Vehicle Name :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.vModel.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Vehicle Model :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.vModel.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Vehicle Number :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.vNumber.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Customer Number :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.customerNumber.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Engine Number :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.engineNumber.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Chase Number :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.chaseNumber.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Order Date :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    widget.singleOrder.orderDate.toString(),
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                    'Estimate Delivery :',
                    style: GoogleFonts.urbanist(
                      textStyle: TextStyle(
                        fontSize: h * 0.015,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    '1 Dec 2023',
                    style: GoogleFonts.urbanist(
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  SizedBox(
                    height: h * 0.015,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(w * 0.04, 0, w * 0.05, 0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: h * 0.01),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Back body updated',
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                              fontSize: h * 0.018,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('d MMM y - hh:mm a')
                              .format(DateTime.now()),
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                              fontSize: h * 0.013,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.02)
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: h * 0.07)
          ],
        ),
      ),
    );
  }

  Widget _imageView(String image) {
    return ClipRRect(
      clipBehavior: Clip.none,
      child: Image.network(image, fit: BoxFit.cover),
    );
  }
}
