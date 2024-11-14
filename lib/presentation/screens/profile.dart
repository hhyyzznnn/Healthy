import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthy/constants/app_bar.dart';
import 'setting.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '사용자 이름';
  String userGoal = '체중 감량';
  String dietPlan = '1일 3식 균형 식단';

  @override
  void initState() {
    super.initState();
    _loadUserSettings(); // 앱 시작 시 사용자 설정 로드
  }

  Future<void> _loadUserSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '사용자 이름';
      userGoal = prefs.getString('goal') ?? '체중 감량';
      dietPlan = prefs.getString('dietPlan') ?? '1일 3식 균형 식단';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: '프로필',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
              // 돌아온 후 설정값 다시 로드
              await _loadUserSettings();
            },
          ),
        ],
      ),
      body: Center(  // 화면 중앙에 위치
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/default_profile.jpeg'),
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(height: 16),
              Text(
                userName,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '운동 목표: $userGoal',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                '식단 계획: $dietPlan',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}