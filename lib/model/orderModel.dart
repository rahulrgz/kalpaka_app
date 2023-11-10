import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  DateTime? orderDate;
  String? customerName;
  String? customerNumber;
  String? vNumber;
  String? vModel;
  String? engineNumber;
  String? uid;
  DocumentReference? ref;
  String? chaseNumber;
  String img;
  String? aduttionalDetails;
  int? Status;

  OrderModel(
      {required this.orderDate,
      required this.customerName,
      required this.customerNumber,
      required this.vModel,
      required this.engineNumber,
      required this.uid,
      required this.chaseNumber,
      this.ref,
      required this.img,
      required this.aduttionalDetails,
      required this.Status,
      required this.vNumber});
  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      orderDate: json['orderDate'] == null
          ? DateTime.now()
          : json['orderDate'].toDate(),
      img: json["img"],
      customerName: json["customerName"] ?? '',
      customerNumber: json["number"] ?? '',
      vModel: json["vModel"] ?? '',
      engineNumber: json["engineNumber"] ?? '',
      uid: json["uid"] ?? '',
      chaseNumber: json["chaseNumber"] ?? "",
      aduttionalDetails: json['aduttionalDetails'] ?? '',
      ref: json["ref"],
      Status: json['Status'] ?? 0,
      vNumber: json['vNumber'] ?? '');
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Status"] = Status;
    data["vNumber"] = vNumber;
    data["orderDate"] = orderDate;

    data["customerName"] = customerName;
    data["number"] = customerNumber;
    data["vModel"] = vModel;
    data["engineNumber"] = engineNumber;
    data["uid"] = uid;
    data["ref"] = ref;
    data["chaseNumber"] = chaseNumber;
    data["img"] = img;
    data["aduttionalDetails"] = aduttionalDetails;
    return data;
  }

  OrderModel copyWith({
    DateTime? orderDate,
    String? customerName,
    String? number,
    String? vModel,
    String? engineNumber,
    String? uid,
    DocumentReference? ref,
    String? chaseNumber,
    String? aduttionalDetails,
    String? img,
    int? Status,
    String? vNumber,
  }) =>
      OrderModel(
        orderDate: orderDate ?? this.orderDate,
        customerName: customerName ?? this.customerName,
        customerNumber: number ?? this.customerNumber,
        vModel: vModel ?? this.vModel,
        uid: uid,
        engineNumber: engineNumber ?? this.engineNumber,
        ref: ref ?? this.ref,
        chaseNumber: chaseNumber ?? this.chaseNumber,
        aduttionalDetails: aduttionalDetails ?? this.aduttionalDetails,
        img: img ?? this.img,
        Status: Status ?? this.Status,
        vNumber: vNumber ?? this.vNumber,
      );
}
