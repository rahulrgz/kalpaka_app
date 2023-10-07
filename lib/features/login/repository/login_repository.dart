import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalpaka_app/core/constants/firebase_constants/firebase_constants.dart';
import 'package:kalpaka_app/core/failure.dart';
import 'package:kalpaka_app/core/type_def.dart';
import 'package:kalpaka_app/model/usermodel.dart';

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

  FutureEither<UserModel> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      String loginId = userCredential.user!.uid;

      UserModel user;

      if (userCredential.additionalUserInfo!.isNewUser) {
        user = UserModel(
            loginDate: DateTime.now(),
            name: userCredential.user!.displayName ?? 'No name',
            profile: userCredential.user!.photoURL ?? '',
            phone: '',
            email: userCredential.user!.email ?? 'no email',
            uid: userCredential.user!.uid);
      } else {
        user = await getuser(uid: userCredential.user!.uid);
      }
      return right(user);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(fail: e.toString()));
    }
  }

  Future<UserModel> getuser({required String uid}) async {
    var doc = await _firestore
        .collection(FirebaseConstants.usersCollections)
        .doc(uid)
        .get();
    return UserModel.fromJson(doc.data() as Map<String, dynamic>);
  }
}
