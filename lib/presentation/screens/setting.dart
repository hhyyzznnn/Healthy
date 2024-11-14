import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String initialUserName;
  final String initialGoal;
  final String initialDietPlan;

  const SettingsScreen({
    super.key,
    required this.initialUserName,
    required this.initialGoal,
    required this.initialDietPlan,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late String _selectedGoal;
  late String _dietPlan;
  late String _userName;
  String _profileImage = 'assets/default_profile.jpeg';

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _dietPlanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 초기값 설정
    _selectedGoal = widget.initialGoal;
    _dietPlan = widget.initialDietPlan;
    _userName = widget.initialUserName;

    _userNameController.text = _userName;
    _dietPlanController.text = _dietPlan;
  }

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
                  // 설정 값을 반환
                  Navigator.pop(context, {
                    'name': _userName,
                    'goal': _selectedGoal,
                    'dietPlan': _dietPlan,
                  });
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