import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModel;

class UserModel {
  DateTime loginDate;
  String name;
  String profile;
  String email;
  String phone;
  String uid;
  DocumentReference? ref;
  DateTime? lastLogged;
  String? label;

  UserModel({
    required this.loginDate,
    required this.name,
    required this.profile,
    required this.phone,
    required this.email,
    required this.uid,
    required this.label,
    this.ref,
    required this.lastLogged,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      loginDate: json['loginDate'] == null
          ? DateTime.now()
          : json['loginDate'].toDate(),
      name: json["name"] ?? '',
      profile: json["profile"] ?? '',
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
      uid: json["uid"] ?? '',
      label: json["labl"] ?? "",
      lastLogged: json['lastLogged'] == null
          ? DateTime.now()
          : json['lastLogged'].toDate(),
      ref: json["ref"]);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["loginDate"] = loginDate;
    data["name"] = name;
    data["profile"] = profile;
    data["phone"] = phone;
    data["email"] = email;
    data["uid"] = uid;
    data["ref"] = ref;
    data["lastLogged"] = lastLogged;
    data["label"] = label;
    return data;
  }

  UserModel copyWith({
    DateTime? loginDate,
    String? name,
    String? profile,
    String? phone,
    String? email,
    String? uid,
    DocumentReference? ref,
    DateTime? lastLogged,
    String? label,
  }) =>
      UserModel(
        loginDate: loginDate ?? this.loginDate,
        name: name ?? this.name,
        profile: profile ?? this.profile,
        email: email ?? this.email,
        uid: uid ?? this.uid,
        phone: phone ?? this.phone,
        ref: ref ?? this.ref,
        label: label ?? this.label,
        lastLogged: lastLogged ?? this.lastLogged,
      );
}
