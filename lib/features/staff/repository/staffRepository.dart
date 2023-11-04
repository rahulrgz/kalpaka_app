import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

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
  FutureEither addStaff({required StaffModel staff}) async {
    try {
      return right(_staff.add(staff.toJson()));
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
}
