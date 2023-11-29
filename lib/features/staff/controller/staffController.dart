import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kalpaka_app/features/login/repository/login_repository.dart';
import 'package:kalpaka_app/model/staffModel.dart';

import '../../../core/commons/utils.dart';
import '../../../model/attendenceOfStaff.dart';
import '../repository/staffRepository.dart';

final getStaffAttendenceProvider = StreamProvider.family.autoDispose(
    (ref, String data) => ref
        .watch(staffControllerProvider.notifier)
        .getStaffAttendence(data: data)); //to get staffsattendence in stream
final getStaffReportProvider = StreamProvider.family.autoDispose(
    (ref, String staffId) => ref
        .watch(staffControllerProvider.notifier)
        .getStaffReport(
            staffId: staffId)); //toget the entire attendence report of staff
final selectedDateProvider = StateProvider<DateTime?>((ref) => null);
final getStaffProvider = StreamProvider((ref) => ref
    .watch(staffControllerProvider.notifier)
    .getStaffs()); //to get entire staff
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

  Stream<List<StaffModel>> getStaffs() {
    return _staffRepository.getStaffs();
  }

  addCurrendayStatus(
      {required String stafDailyAttendence,
      required String overtime,
      required BuildContext context,
      required String amt,
      required String staffId}) async {
    DateTime now = DateTime.now();
    var datePicked1 = DateTime(now.year, now.month, now.day, 0, 0, 0);
    print("contr");
    print(datePicked1);
    // selectedDate1 = value;
    // ref.watch(startDateProvider.notifier).update((state) => datePicked1);
    // String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    var staffDailyAttendence = StaffAttendence(
        uploadDate: datePicked1,
        attendence: stafDailyAttendence,
        overtime: overtime,
        uid: "",
        delete: false,
        staffId: staffId,
        amt: amt);
    final result = await _staffRepository.addCurrendayStatus(
        staffDailyAttendence: staffDailyAttendence, staffId: staffId);
    result.fold((l) {
      showSnackBar(context: context, content: "Status Updated Failed");
    }, (r) {
      showSnackBar(context: context, content: "Status Updated Successfully");
      Navigator.pop(context);
    });
  }

  Stream<List<StaffAttendence>> getStaffAttendence({required String data}) {
    return _staffRepository.getStaffAttendence(data: data);
  }

  Stream<List<StaffAttendence>> getStaffReport({required String staffId}) {
    return _staffRepository.getStaffReport(staffId: staffId);
  }
}
