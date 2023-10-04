import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';

import '../../core/global_variables/global_variables.dart';

class ViewOrderScreen extends StatefulWidget {
  const ViewOrderScreen({super.key});

  @override
  State<ViewOrderScreen> createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {
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
        content: SizedBox(
          height: h * 0.05,
          width: w * 0.3,
          child: Column(
            children: [
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
        backgroundColor: Pallete.containerColor,
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
            onPressed: () {},
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
          children: [
            Container(
              height: h * 0.2,
              width: w,
              color: Pallete.containerColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: w * 0.05),
                  Container(
                    height: h * 0.15,
                    width: h * 0.15,
                    color: Colors.red,
                    child: Image.network(
                      'https://scontent.fcok4-1.fna.fbcdn.net/v/t1.6435-9/122314289_180909316906067_4725046546716825343_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=ImuiRPnECwcAX9l4IEN&_nc_ht=scontent.fcok4-1.fna&oh=00_AfCYwah78HnlPyk8zhAZOXrxuz1CMEWeBNBMrm8Hv3bygw&oe=6544A4F2',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: w * 0.02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eicher 2048 XP',
                        style: TextStyle(
                            fontSize: h * 0.024,
                            color: Pallete.darkColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pending',
                        style: TextStyle(
                          fontSize: h * 0.012,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Customer: Rahul Ramesh',
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
            ),
            SizedBox(
              height: h * 0.045,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Customer Name : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  ' ',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),

            Divider(thickness: w * 0.001),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Customer Number : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  '8858484848',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Vehicle Name : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  'Eicher 2048 XP',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Vehicle Model : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  'Eicher 2048 XP',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Vehicle Number : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  'Eicher 2048 XP',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Engine Number : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  '204865790876543256789',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Chase Number : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  'Eicher8765434567890XP',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Order Date : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  '29 Sep 2023',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Estimate Delivery : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  '1 Dec 2023',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.08),
                Text(
                  'Current Stage : ',
                  style: TextStyle(
                    fontSize: h * 0.018,
                    color: Pallete.darkColor,
                  ),
                ),
                Text(
                  'Work in Progress',
                  style: TextStyle(
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Pallete.darkColor,
                  ),
                ),
              ],
            ),
            Divider(thickness: w * 0.001),

            // SizedBox(
            //   height: h * 0.015,
            // ),
          ],
        ),
      ),
    );
  }
}
