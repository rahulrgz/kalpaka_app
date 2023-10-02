import 'package:cloud_firestore/cloud_firestore.dart';

UsersModel? usersModel;

class UsersModel {
  Timestamp loginDate;
  String name;
  String profile;
  String email;
  String uid;
  DocumentReference? ref;
  UsersModel({
    required this.loginDate,
    required this.name,
    required this.profile,
    required this.email,
    required this.uid,
    this.ref,
  });
  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
      loginDate: json["loginDate"] ?? '',
      name: json["name"] ?? '',
      profile: json["profile"] ?? '',
      email: json["email"] ?? '',
      uid: json["uid"] ?? '',
      ref: json["ref"]);
  Map<String, dynamic> toJson() => {
        "loginDate": loginDate,
        "name": name,
        "profile": profile,
        "email": email,
        "uid": uid,
        "ref": ref,
      };

  UsersModel copyWith({
    Timestamp? loginDate,
    String? name,
    String? profile,
    String? email,
    String? uid,
    DocumentReference? ref,
  }) =>
      UsersModel(
        loginDate: loginDate ?? this.loginDate,
        name: name ?? this.name,
        profile: profile ?? this.profile,
        email: email ?? this.email,
        uid: uid ?? this.uid,
        ref: ref,
      );
}
