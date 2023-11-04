import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/model/orderModel.dart';
import 'package:kalpaka_app/model/staffModel.dart';

import '../../../core/commons/utils.dart';
import '../repository/orderrepository.dart';

final getOrdersProvider = StreamProvider(
    (ref) => ref.watch(orderControllerProvider.notifier).getOreders());
final orderControllerProvider = StateNotifierProvider((ref) {
  return OrderController(
      orderRepository: ref.read(orderRepositoryProvider), ref: ref);
});

class OrderController extends StateNotifier<bool> {
  final OrderRepository _orderRepository;
  final Ref _ref;

  OrderController({required OrderRepository orderRepository, required Ref ref})
      : _orderRepository = orderRepository,
        _ref = ref,
        super(false);

  void addOrder(
      {required String cname,
      required String vmodel,
      required String enumber,
      required String cnumber,
      required String phnumber,
      required String adddetails,
      required String img,
      required String vNumber,
      required BuildContext ctx}) async {
    var copy = OrderModel(
        orderDate: DateTime.now(),
        customerName: cname,
        customerNumber: phnumber,
        vModel: vmodel,
        engineNumber: enumber,
        uid: "",
        chaseNumber: cnumber,
        aduttionalDetails: adddetails,
        img: img,
        Status: 0,
        vNumber: vNumber);
    final res = await _orderRepository.addOrder(order: copy);
    res.fold((l) => showSnackBar(context: ctx, content: "Failed to Add Order"),
        (r) {
      showSnackBar(context: ctx, content: "Order Added Successfully");
      Navigator.pop(ctx);
    });
  }

  Stream<List<OrderModel>> getOreders() {
    return _orderRepository.getOreders();
  }
}
