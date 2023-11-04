import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalpaka_app/core/constants/firebase_constants/firebase_constants.dart';
import 'package:kalpaka_app/core/failure.dart';
import 'package:kalpaka_app/core/type_def.dart';
import 'package:kalpaka_app/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/firebase_providers.dart';
import '../../../model/orderModel.dart';

final orderRepositoryProvider = Provider((ref) => OrderRepository(
      firestore: ref.read(firestoreProvider),
    ));

class OrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _order =>
      _firestore.collection(FirebaseConstants.orderCollection);
  FutureEither addOrder({required OrderModel order}) async {
    try {
      return right(_order.add(order.toJson()).then((value) {
        var uid = value.id.toString();
        _order.doc(uid).update({
          "uid": uid,
        });
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  }

  Stream<List<OrderModel>> getOreders() {
    return _order.snapshots().map((event) => event.docs
        .map((e) => OrderModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());
  }
}
