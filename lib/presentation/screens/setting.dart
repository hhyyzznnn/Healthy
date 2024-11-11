import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedGoal = '체중 감량';
  String _dietPlan = '';
  String _userName = '';
  String _profileImage = 'assets/default_profile.png'; // 기본 프로필 이미지 경로

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _dietPlanController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _dietPlanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 사진
            Center(
              child: GestureDetector(
                onTap: () {
                  // 프로필 사진 변경 기능 추가 예정
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('프로필 사진 변경 기능 구현 필요')),
                  );
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(_profileImage),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 사용자 이름 입력
            TextFormField(
              controller: _userNameController,
              decoration: const InputDecoration(
                labelText: '사용자 이름',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // 운동 목표 선택
            const Text('운동 목표'),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedGoal,
              items: <String>['체중 감량', '근육량 증가', '유지']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGoal = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),

            // 식단 계획 입력
            TextFormField(
              controller: _dietPlanController,
              decoration: const InputDecoration(
                labelText: '식단 계획',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _dietPlan = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // 저장 버튼
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 설정 저장 로직 추가
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('설정이 저장되었습니다.')),
                  );
                },
                child: const Text('저장'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}