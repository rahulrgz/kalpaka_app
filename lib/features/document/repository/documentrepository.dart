import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalpaka_app/core/constants/firebase_constants/firebase_constants.dart';
import 'package:kalpaka_app/core/failure.dart';
import 'package:kalpaka_app/core/type_def.dart';
import 'package:kalpaka_app/model/documentmodel.dart';
import 'package:kalpaka_app/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/firebase_providers.dart';
import '../../../model/orderModel.dart';

final documentRepositoryProvider = Provider((ref) => DocumentRepository(
      firestore: ref.read(firestoreProvider),
    ));

class DocumentRepository {
  final FirebaseFirestore _firestore;

  DocumentRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _document =>
      _firestore.collection(FirebaseConstants.document);

  Stream<List<DocumentModel>> getDocuments() {
    return _document.snapshots().map((event) => event.docs
        .map((e) => DocumentModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());
  }

  FutureEither uploadDocument({required DocumentModel doc}) async {
    try {
      return Right(_document.add(doc.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  }
}
