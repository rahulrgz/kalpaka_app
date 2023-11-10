import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalpaka_app/core/constants/firebase_constants/firebase_constants.dart';
import 'package:kalpaka_app/core/failure.dart';
import 'package:kalpaka_app/core/type_def.dart';
import 'package:kalpaka_app/features/login/repository/login_repository.dart';
import 'package:kalpaka_app/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/firebase_providers.dart';
import '../../../model/documentmodel.dart';
import '../../../model/orderModel.dart';
import '../../../model/staffModel.dart';

final homeRepositoryProvider = Provider((ref) => HomeRepository(
      firestore: ref.read(firestoreProvider),
    ));

class HomeRepository {
  final FirebaseFirestore _firestore;

  HomeRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollections);
  CollectionReference get _staff =>
      _firestore.collection(FirebaseConstants.staffCollection);
  CollectionReference get _document =>
      _firestore.collection(FirebaseConstants.document);
  Stream<List<UserModel>> getUsers() {
    return _users.where("uid", isNotEqualTo: currentUserId).snapshots().map(
        (event) => event.docs
            .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  // Stream getNumberOfStaff() {
  //   return _staff.snapshots().map((event) => event.docs.map((e) =>
  //       StaffModel.fromJson(e.data() as Map<String,dynamic>)).toList());
  // }
  //
  // Stream getNumberOfdocuments() {
  //   return _users.where("uid", isNotEqualTo: currentUserId).snapshots().map((event) => event.docs.map((e) =>
  //       DocumentModel.fromJson(e.data() as Map<String,dynamic>)).toList());;
  // }
}
