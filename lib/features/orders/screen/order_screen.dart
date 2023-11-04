import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/core/constants/asset_constants/asset_constants.dart';
import 'package:kalpaka_app/features/orders/controller/oredercontroller.dart';
import 'package:kalpaka_app/features/orders/screen/add_order.dart';

import '../../../core/commons/error.dart';
import '../../../core/commons/loader.dart';
import '../../../core/global_variables/global_variables.dart';
import '../../../core/theme/pallete.dart';
import 'ViewOrder.dart';

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
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ref.watch(getOrdersProvider).when(
                data: (orders) {
                  return ListView.builder(
                      itemCount: orders.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.005,
                              bottom: h * 0.015,
                              right: h * 0.015,
                              left: h * 0.015),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => ViewOrderScreen(
                                    singleOrder: orders[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: h * 0.12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(h * 0.025),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Pallete.primaryColor,
                                      blurRadius: 1,
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
                                      borderRadius:
                                          BorderRadius.circular(h * 0.025),
                                    ),
                                    child: Image.network(
                                        orders[index].img.toString()),
                                  ),
                                  SizedBox(
                                    width: h * 0.02,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: h * 0.013),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          orders[index].vModel.toString(),
                                          style: TextStyle(
                                              fontSize: h * 0.021,
                                              color: Pallete.darkColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Customer: ${orders[index].customerName.toString()}',
                                          style: TextStyle(
                                              fontSize: h * 0.017,
                                              color: Pallete.darkColor),
                                        ),
                                        Text(
                                          'Pending',
                                          style: TextStyle(
                                              fontSize: h * 0.015,
                                              color: Colors.red),
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
                          ),
                        );
                      });
                },
                error: (error, stackTrace) =>
                    ErrorText(error: error.toString()),
                loading: () => const Loader());
          },
        ),
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
