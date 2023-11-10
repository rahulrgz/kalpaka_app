import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/features/login/repository/login_repository.dart';
import 'package:kalpaka_app/features/login/screens/userdetails.dart';
import 'package:kalpaka_app/model/usermodel.dart';

import '../../../core/commons/utils.dart';
import '../../home/screen/bottomnavbar_page.dart';
import '../screens/login_screen.dart';

final getUserDataProvider = StreamProvider(
    (ref) => ref.watch(loginControllerProvider.notifier).getUserData());
final userProvider = StateProvider<UserModel?>((ref) => null);
final loginControllerProvider = StateNotifierProvider((ref) {
  return LoginController(
      loginRepository: ref.read(loginRepositoryProvider), ref: ref);
});
// final loginRepositoryProvider = Provider((ref) {
//   return LoginRepository(
//       firestore: ref.read(firestoreProvider),
//       auth: ref.read(authProvider),
//       googleSignIn: ref.read(googleSignInProvider));
// });

class LoginController extends StateNotifier<bool> {
  final LoginRepository _loginRepository;
  final Ref _ref;
  LoginController({required LoginRepository loginRepository, required Ref ref})
      : _loginRepository = loginRepository,
        _ref = ref,
        super(false);

  void googlesignin({required BuildContext context}) async {
    var res = await _loginRepository.googleSignIn();

    res.fold((l) => showSnackBar(context: context, content: l.toString()), (r) {
      _ref.read(userProvider.notifier).update((state) => r);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserDetails(),
          ));
    });
  }

  Future<UserModel> getUser({required String uid}) async {
    return _loginRepository.getUser(uid: uid);
  }

  void logOut(BuildContext context) async {
    await _loginRepository.logOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

  Future<void> updateUserData(
      {required String userName,
      required String phoneNUmber,
      required String label,
      required BuildContext context}) async {
    var copy =
        userModel!.copyWith(name: userName, phone: phoneNUmber, label: label);
    final res = await _loginRepository.updateUserData(userData: copy);
    res.fold((l) => showSnackBar(context: context, content: "Update Failed"),
        (r) {
      _ref.read(userProvider.notifier).update((state) => r);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    });
  }

  Stream<UserModel> getUserData() {
    return _loginRepository.getUserData();
  }
}
