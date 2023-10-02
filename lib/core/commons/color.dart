import 'package:flutter/material.dart';

import '../theme/pallete.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Pallete.secondaryColor,
          ),
          Container(
            height: 100,
            color: Pallete.shadowColor,
          ),
          Container(
            height: 100,
            color: Pallete.containerColor,
          ),
          Container(
            height: 100,
            color: Pallete.darkColor,
          ),
          Container(
            height: 100,
            color: Pallete.whiteColor,
          ),
        ],
      ),
    );
  }
}
