import 'package:cloud_firestore/cloud_firestore.dart';

class StaffAttendence {
  DateTime uploadDate;
  String attendence;
  String overtime;
  String staffId;
  String uid;
  DocumentReference? ref;
  bool delete;

//<editor-fold desc="Data Methods">
  StaffAttendence({
    this.ref,
    required this.uploadDate,
    required this.staffId,
    required this.attendence,
    required this.overtime,
    required this.uid,
    required this.delete,
  });

  StaffAttendence copyWith({
    DateTime? uploadDate,
    String? attendence,
    String? overtime,
    String? uid,
    bool? delete,
    String? staffId,
    DocumentReference? ref,
  }) {
    return StaffAttendence(
      uploadDate: uploadDate ?? this.uploadDate,
      attendence: attendence ?? this.attendence,
      overtime: overtime ?? this.overtime,
      uid: uid ?? this.uid,
      delete: delete ?? this.delete,
      ref: ref ?? this.ref,
      staffId: staffId ?? this.staffId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uploadDate': this.uploadDate,
      'attendence': this.attendence,
      'overtime': this.overtime,
      'uid': this.uid,
      'delete': this.delete,
      'ref': this.ref,
      'staffId': this.staffId,
    };
  }

  factory StaffAttendence.fromMap(Map<String, dynamic> map) {
    return StaffAttendence(
      uploadDate: map['uploadDate'].toDate(),
      attendence: map['attendence'] as String,
      overtime: map['overtime'] as String,
      uid: map['uid'] as String,
      delete: map['delete'] as bool,
      ref: map['ref'] as DocumentReference,
      staffId: map['staffId'] as String,
    );
  }

//</editor-fold>
}
