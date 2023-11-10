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

String? currentUserId;
final loginRepositoryProvider = Provider((ref) => LoginRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class LoginRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  LoginRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollections);
  FutureEither<UserModel> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
      final googleAuth = await googleuser?.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredentials =
          await _auth.signInWithCredential(credentials);

      if (userCredentials.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            loginDate: DateTime.now(),
            name: userCredentials.user!.displayName ?? 'No name',
            profile: userCredentials.user!.photoURL ?? '',
            phone: userCredentials.user!.phoneNumber ?? '',
            email: userCredentials.user!.email ?? 'no email',
            uid: userCredentials.user!.uid,
            lastLogged: DateTime.now(),
            label: '');
        currentUserId = userCredentials.user!.uid;
        _users
            .doc(userCredentials.user!.uid.toString())
            .set(userModel!.toJson());
        var dataa =
            await _users.doc(userCredentials.user!.uid.toString()).get();
        var ref = dataa.reference;
        var copy = userModel!.copyWith(ref: ref);
        userModel = copy;
        _users.doc(userCredentials.user!.uid.toString()).update(copy!.toJson());
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", userCredentials.user!.uid.toString());
      } else {
        userModel = await getUser(uid: userCredentials.user!.uid);
        currentUserId = userModel?.uid;
        userModel!.copyWith(lastLogged: DateTime.now());
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uid", userCredentials.user!.uid.toString());
      }
      return right(userModel!);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  }

  Future<UserModel> getUser({required String uid}) async {
    var doc = await _firestore
        .collection(FirebaseConstants.usersCollections)
        .doc(uid)
        .get();
    return UserModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<void> logOut() async {
    await _googleSignIn.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("uid");
  }

  FutureEither<UserModel> updateUserData({required UserModel userData}) async {
    try {
      await _users.doc(userData.uid.toString()).update(userData.toJson());
      var Data = userData;
      return right(Data);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  }

  Stream<UserModel> getUserData() {
    return _users.doc(userModel!.uid.toString()).snapshots().map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }
}
