import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpaka_app/model/staffModel.dart';

import '../../../core/commons/utils.dart';
import '../../login/repository/login_repository.dart';
import '../repository/staffRepository.dart';

final staffControllerProvider = StateNotifierProvider((ref) {
  return StaffController(
      staffRepository: ref.read(staffRepositoryProvider), ref: ref);
});

class StaffController extends StateNotifier<bool> {
  final StaffRepository _staffRepository;
  final Ref _ref;

  StaffController({required StaffRepository staffRepository, required Ref ref})
      : _staffRepository = staffRepository,
        _ref = ref,
        super(false);
  Future<void> addStaff(
      {required BuildContext context,
      required String name,
      required String phone,
      required String age,
      required String place,
      required String salary,
      required String profile}) async {
    StaffModel staff = StaffModel(
        addedDate: DateTime.now(),
        name: name,
        profile: profile,
        phone: phone,
        place: place,
        uid: "",
        salary: salary,
        age: age);
    final res = await _staffRepository.addStaff(staff: staff);
    res.fold((l) => showSnackBar(context: context, content: "Failed"), (r) {
      showSnackBar(context: context, content: "Staff Added Successfully");
      Navigator.pop(context);
    });
  }
}
