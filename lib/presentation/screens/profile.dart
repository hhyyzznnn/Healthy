import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: '프로필',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    initialUserName: userName,
                    initialGoal: userGoal,
                    initialDietPlan: dietPlan,
                  ),
                ),
              );

              if (result != null) {
                setState(() {
                  userName = result['name'] ?? userName;
                  userGoal = result['goal'] ?? userGoal;
                  dietPlan = result['dietPlan'] ?? dietPlan;
                });
              }
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
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
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