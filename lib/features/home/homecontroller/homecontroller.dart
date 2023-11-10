import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/model/orderModel.dart';
import 'package:kalpaka_app/model/staffModel.dart';

import '../../../core/commons/utils.dart';
import '../../../model/usermodel.dart';
import '../repository/homeRepositorty.dart';

final allUsrProvider = StreamProvider.autoDispose(
    (ref) => ref.watch(HomeControllerProvider.notifier).getUsers());
//to view no of usr in it contains all usr in app
// final allStafsProvider=StreamProvider((ref) => ref.watch(HomeControllerProvider.notifier).getNumberOfStaff());
// final alldocProvider=StreamProvider((ref) => ref.watch(HomeControllerProvider.notifier).getNumberOfdocuments());

final HomeControllerProvider = StateNotifierProvider((ref) {
  return HomeController(
      homeRepository: ref.read(homeRepositoryProvider), ref: ref);
});

class HomeController extends StateNotifier<bool> {
  final HomeRepository _homeRepository;
  final Ref _ref;

  HomeController({required HomeRepository homeRepository, required Ref ref})
      : _homeRepository = homeRepository,
        _ref = ref,
        super(false);
  Stream<List<UserModel>> getUsers() {
    return _homeRepository.getUsers();
  }

  // Stream getNumberOfStaff() {
  //   return _homeRepository.getNumberOfStaff();
  // }
  //
  // Stream getNumberOfdocuments() {
  //   return _homeRepository.getNumberOfdocuments();
  // }
}
