import 'package:cloud_firestore/cloud_firestore.dart';

class StaffModel {
  DateTime? addedDate;
  String name;
  String profile;
  String place;
  String phone;
  String uid;
  DocumentReference? ref;
  String? age;
  String? salary;

  StaffModel({
    required this.addedDate,
    required this.name,
    required this.profile,
    required this.phone,
    required this.place,
    required this.uid,
    required this.salary,
    this.ref,
    required this.age,
  });
  factory StaffModel.fromJson(Map<String, dynamic> json) => StaffModel(
      addedDate: json['addedDate'] == null
          ? DateTime.now()
          : json['addedDate'].toDate(),
      name: json["name"] ?? '',
      profile: json["profile"] ?? '',
      place: json["place"] ?? '',
      phone: json["phone"] ?? '',
      uid: json["uid"] ?? '',
      salary: json["salary"] ?? "",
      age: json['age'] == null ? DateTime.now() : json['age'].toDate(),
      ref: json["ref"]);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["addedDate"] = addedDate;
    data["name"] = name;
    data["profile"] = profile;
    data["phone"] = phone;
    data["place"] = place;
    data["uid"] = uid;
    data["ref"] = ref;
    data["age"] = age;
    data["salary"] = salary;
    return data;
  }

  StaffModel copyWith({
    DateTime? loginDate,
    String? name,
    String? profile,
    String? phone,
    String? email,
    String? uid,
    DocumentReference? ref,
    String? age,
    String? label,
  }) =>
      StaffModel(
        addedDate: loginDate ?? this.addedDate,
        name: name ?? this.name,
        profile: profile ?? this.profile,
        place: email ?? this.place,
        uid: uid ?? this.uid,
        phone: phone ?? this.phone,
        ref: ref ?? this.ref,
        salary: label ?? this.salary,
        age: age ?? this.age,
      );
}
