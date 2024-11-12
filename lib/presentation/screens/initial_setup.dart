import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialSetupScreen extends StatefulWidget {
  const InitialSetupScreen({super.key});

  @override
  State<InitialSetupScreen> createState() => _InitialSetupScreenState();
}

class _InitialSetupScreenState extends State<InitialSetupScreen> {
  final _nameController = TextEditingController();
  String? _gender;
  int? _age;
  double? _weight;
  double? _height;
  String _goal = '체중 감량';
  int _dailyWorkoutGoal = 30;
  int _dailyCalorieGoal = 2000;

  Future<void> _saveUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _nameController.text);
    await prefs.setString('userGender', _gender ?? '');
    await prefs.setInt('userAge', _age ?? 0);
    await prefs.setDouble('userWeight', _weight ?? 0.0);
    await prefs.setDouble('userHeight', _height ?? 0.0);
    await prefs.setString('userGoal', _goal);
    await prefs.setInt('dailyWorkoutGoal', _dailyWorkoutGoal);
    await prefs.setInt('dailyCalorieGoal', _dailyCalorieGoal);

    // 서버에도 저장하는 로직 추가 가능
    Navigator.pushReplacementNamed(context, '/home'); // 홈 화면으로 이동
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('초기 설정')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('이름', style: TextStyle(fontSize: 18)),
            TextField(controller: _nameController),
            const SizedBox(height: 16),
            const Text('성별', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _gender,
              hint: const Text('성별을 선택하세요'),
              items: ['남성', '여성'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _gender = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('나이', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => _age = int.tryParse(value),
            ),
            const SizedBox(height: 16),
            const Text('현재 체중 (kg)', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => _weight = double.tryParse(value),
            ),
            const SizedBox(height: 16),
            const Text('키 (cm)', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => _height = double.tryParse(value),
            ),
            const SizedBox(height: 16),
            const Text('목표 설정', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _goal,
              items: ['체중 감량', '근육량 증가', '건강 유지'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _goal = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('일일 운동 목표 (분)', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  _dailyWorkoutGoal = int.tryParse(value) ?? 30,
            ),
            const SizedBox(height: 16),
            const Text('일일 칼로리 목표 (kcal)', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  _dailyCalorieGoal = int.tryParse(value) ?? 2000,
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveUserPreferences,
                child: const Text('시작하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
