import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentModel {
  DateTime uploadDate;
  String uploadedUser;
  String description;
  String uid;
  String doc;

  DocumentModel({
    required this.description,
    required this.uid,
    required this.uploadDate,
    required this.uploadedUser,
    required this.doc,
  });
  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        uploadDate: json['uploadDate'] == null
            ? DateTime.now()
            : json['uploadDate'].toDate(),
        uid: json["uid"] ?? '',
        description: json["description"] ?? '',
        uploadedUser: json["uploadedUser"] ?? '',
        doc: json["doc"] ?? '',
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uploadDate"] = uploadDate;

    data["uid"] = uid;
    data["description"] = description;
    data["uploadedUser"] = uploadedUser;
    data["doc"] = doc;

    return data;
  }

  DocumentModel copyWith({
    DateTime? uploadDate,
    String? uploadedUser,
    String? description,
    String? uid,
    String? doc,
  }) =>
      DocumentModel(
        uid: uid ?? this.uid,
        description: description ?? this.description,
        uploadDate: uploadDate ?? this.uploadDate,
        uploadedUser: uploadedUser ?? this.uploadedUser,
        doc: doc ?? this.doc,
      );
}
