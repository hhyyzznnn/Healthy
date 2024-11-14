import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

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
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '사용자 이름';
      _selectedGoal = prefs.getString('goal') ?? '체중 감량';
      _dietPlan = prefs.getString('dietPlan') ?? '1일 3식 균형 식단';

      _userNameController.text = _userName;
      _dietPlanController.text = _dietPlan;
    });
  }

  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _userName);
    await prefs.setString('goal', _selectedGoal);
    await prefs.setString('dietPlan', _dietPlan);
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
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _saveSettings(); // SharedPreferences에 설정 저장
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('설정이 저장되었습니다.')),
                  );
                  // 저장 후 ProfileScreen으로 값 반환
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