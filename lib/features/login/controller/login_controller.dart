import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/features/login/repository/login_repository.dart';
import 'package:kalpaka_app/features/login/screens/userdetails.dart';
import 'package:kalpaka_app/model/usermodel.dart';

import '../../../core/commons/utils.dart';
import '../../../core/firebase_providers.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);
final loginControllerProvider = Provider((ref) {
  return LoginController(
      loginRepository: ref.read(loginRepositoryProvider), ref: ref);
});
final loginRepositoryProvider = Provider((ref) {
  return LoginRepository(
      firestore: ref.read(firestoreProvider),
      auth: ref.read(authProvider),
      googleSignIn: ref.read(googleSignInProvider));
});

class LoginController {
  final LoginRepository _loginRepository;
  final Ref _ref;
  LoginController({required LoginRepository loginRepository, required Ref ref})
      : _loginRepository = loginRepository,
        _ref = ref;
  googlesignin({required BuildContext context}) async {
    var res = await _loginRepository.googleSignIn();
    res.fold((l) => showSnackBar(context, l.fail), (r) {
      _ref.read(userProvider.notifier).update((state) => r);
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const UserDetails(),
          ));
    });
  }
}
