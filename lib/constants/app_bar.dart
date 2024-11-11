import 'package:flutter/material.dart';
import 'colors.dart';

PreferredSizeWidget buildAppBar({required String title, List<Widget>? actions}) {
  return AppBar(
    title: Padding(
      padding:  EdgeInsets.only(left: 15),
      child: Text(title, style: const TextStyle(fontFamily: 'BMDOHYEON',fontSize: 25, color: Colors.white, fontStyle: FontStyle.italic)),
    ),
    centerTitle: false,
    backgroundColor: AppColors.primaryBlue,
    actions: actions
  );
}