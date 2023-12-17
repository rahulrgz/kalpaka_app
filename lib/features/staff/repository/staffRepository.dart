import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kalpaka_app/model/attendenceOfStaff.dart';

import '../../../core/constants/firebase_constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/firebase_providers.dart';
import '../../../core/type_def.dart';
import '../../../model/staffModel.dart';

final staffRepositoryProvider = Provider((ref) => StaffRepository(
      firestore: ref.read(firestoreProvider),
    ));

class StaffRepository {
  //final FirebaseAuth _auth;
  // final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  StaffRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _staff =>
      _firestore.collection(FirebaseConstants.staffCollection);

  // CollectionReference get _staffAttendence =>
  //     _firestore.collection(FirebaseConstants.staffAttendenceCollection);
  FutureEither addStaff({required StaffModel staff}) async {
    try {
      return right(_staff.add(staff.toJson()).then((value) async {
        var data = await value.get();
        var staffId = data.id;
        var reference = data.reference;
        var copy = staff.copyWith(ref: reference, uid: staffId);
        _staff.doc(copy.uid.toString()).update(copy.toJson());
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  }

  Stream<List<StaffModel>> getStaffs() {
    return _staff.snapshots().map((event) => event.docs
        .map((e) => StaffModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());
  }

  FutureEither addCurrendayStatus(
      {required StaffAttendence staffDailyAttendence,
      required String staffId}) async {
    try {
      return right(_staff
          .doc(staffId.toString())
          .collection(FirebaseConstants.staffAttendenceCollection)
          .add(staffDailyAttendence.toMap())
          .then((value) async {
        var data = await value.get();
        var staffAttendecceId = data.id;
        var reference = data.reference;
        var copy = staffDailyAttendence.copyWith(
            ref: reference, uid: staffAttendecceId);
        _staff
            .doc(staffId.toString())
            .collection(FirebaseConstants.staffAttendenceCollection)
            .doc(staffAttendecceId.toString())
            .update(copy.toMap());
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  } //to update current days works status

//todo sorting
//   Stream<List<StaffAttendence>> getStaffAttendence({required String data}) {
//     var d = jsonDecode(data);
//     var staffId = d["staffId"];
//     var date = d["date"];
//     var d1 = DateTime.parse(date);
//
//     return _staff.doc(staffId).collection("staffAttendence").snapshots().map(
//         (event) => event.docs
//             .map((e) =>
//                 StaffAttendence.fromMap(e.data() as Map<String, dynamic>))
//             .toList());
//   } // to show staff attendence according to date
  Stream<List<StaffAttendence>> getStaffAttendence({required String data}) {
    Map decodedData = jsonDecode(data);
    var staffId = decodedData["staffId"];
    var date = decodedData["date"];
    DateTime parsedDate = DateTime.parse(date);
    print("re");
    print(parsedDate);

    // var k =
    return _staff
        .doc(staffId.toString())
        .collection("staffAttendence")
        .where("uploadDate", isEqualTo: parsedDate)
        .snapshots()
        .map((event) => event.docs
            .map((e) =>
                StaffAttendence.fromMap(e.data() as Map<String, dynamic>))
            .toList());
    // print(k);
    // return k;
  }

  Stream<List<StaffAttendence>> getStaffReport({required String staffId}) {
    return _staff
        .doc(staffId.toString())
        .collection("staffAttendence")
        .orderBy("uploadDate", descending: false)
        .snapshots()
        .map((event) => event.docs
            .map((e) =>
                StaffAttendence.fromMap(e.data() as Map<String, dynamic>))
            .toList());
  }

  FutureEither editCurrendayStatus({required StaffAttendence data}) async {
    try {
      return right(data.ref?.update(data.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  }
}
