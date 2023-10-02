import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/constants/asset_constants/asset_constants.dart';
import 'package:kalpaka_app/features/orders/add_order.dart';

import '../../core/global_variables/global_variables.dart';
import '../../core/theme/pallete.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
          'ORDERS',
          style: TextStyle(fontSize: h * 0.021, color: Pallete.darkColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(h * 0.01),
        child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                    top: h * 0.005,
                    bottom: h * 0.015,
                    right: h * 0.015,
                    left: h * 0.015),
                child: Container(
                  height: h * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(h * 0.025),
                    boxShadow: const [
                      BoxShadow(
                          color: Pallete.shadowColor,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 0)),
                    ],
                    color: Pallete.whiteColor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: h * 0.02,
                      ),
                      Container(
                        height: h * 0.09,
                        width: h * 0.09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(h * 0.025),
                        ),
                        child: Image.asset(AssetConstants.logo),
                      ),
                      SizedBox(
                        width: h * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.013),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Eicher 2053XP',
                              style: TextStyle(
                                  fontSize: h * 0.021,
                                  color: Pallete.darkColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Customer: Rahul',
                              style: TextStyle(
                                  fontSize: h * 0.017,
                                  color: Pallete.darkColor),
                            ),
                            Text(
                              'Pending',
                              style: TextStyle(
                                  fontSize: h * 0.015, color: Colors.red),
                            ),
                            SizedBox(
                              height: h * 0.01,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Pallete.whiteColor,
        foregroundColor: Pallete.darkColor,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const AddOrder()),
          );
        },
        icon: Icon(
          CupertinoIcons.add_circled,
          size: h * 0.02,
        ),
        label: Text(
          'ADD ORDER',
          style: TextStyle(fontSize: h * 0.017),
        ),
      ),
    );
  }
}
