import 'package:flutter/material.dart';
import 'colors.dart';

PreferredSizeWidget buildAppBar({required String title, List<Widget>? actions}) {
  return AppBar(
    title: Padding(
      padding:  EdgeInsets.only(left: 17.5),
      child: Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
    ),
    centerTitle: false,
    backgroundColor: AppColors.primaryBlue, // 상수 폴더의 색상 사용
    actions: actions, // 설정 버튼이나 기타 위젯을 추가할 때 사용
  );
}