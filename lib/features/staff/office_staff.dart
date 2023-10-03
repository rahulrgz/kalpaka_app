import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';

class OfficeStaffScreen extends StatefulWidget {
  const OfficeStaffScreen({super.key});

  @override
  State<OfficeStaffScreen> createState() => _OfficeStaffScreenState();
}

class _OfficeStaffScreenState extends State<OfficeStaffScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
    );
  }
}
