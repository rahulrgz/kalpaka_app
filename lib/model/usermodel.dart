import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? usersModel;

class UserModel {
  DateTime loginDate;
  String name;
  String profile;
  String email;
  String phone;
  String uid;
  DocumentReference? ref;

  UserModel({
    required this.loginDate,
    required this.name,
    required this.profile,
    required this.phone,
    required this.email,
    required this.uid,
    this.ref,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      loginDate: json["loginDate"] ?? '',
      name: json["name"] ?? '',
      profile: json["profile"] ?? '',
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
      uid: json["uid"] ?? '',
      ref: json["ref"]);
  Map<String, dynamic> toJson() => {
        "loginDate": loginDate,
        "name": name,
        "profile": profile,
        "phone": phone,
        "email": email,
        "uid": uid,
        "ref": ref,
      };

  UserModel copyWith({
    DateTime? loginDate,
    String? name,
    String? profile,
    String? phone,
    String? email,
    String? uid,
    DocumentReference? ref,
  }) =>
      UserModel(
        loginDate: loginDate ?? this.loginDate,
        name: name ?? this.name,
        profile: profile ?? this.profile,
        email: email ?? this.email,
        uid: uid ?? this.uid,
        phone: phone ?? this.phone,
        ref: ref,
      );
}
