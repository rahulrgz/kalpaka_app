import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants/firebase_constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/firebase_providers.dart';
import '../../../core/type_def.dart';
import '../../../model/staffModel.dart';
import '../../login/repository/login_repository.dart';

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
}
