import 'package:flutter/material.dart';
import 'package:healthy/constants/app_bar.dart';
import 'package:healthy/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: '프로필',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 프로필 사진
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'), // 로컬 이미지 또는 네트워크 이미지 URL 사용 가능
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            // 사용자 이름
            const Text(
              '사용자 이름',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // 사용자 이메일
            const Text(
              'user@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // 기타 정보
            ListTile(
              leading: Icon(Icons.fitness_center, color: AppColors.primaryBlue),
              title: const Text('운동 목표'),
              subtitle: const Text('주 4회 운동'),
            ),
            ListTile(
              leading: Icon(Icons.restaurant, color: AppColors.primaryBlue),
              title: const Text('식단 계획'),
              subtitle: const Text('1일 3식 균형 식단'),
            ),
            ListTile(
              leading: Icon(Icons.show_chart, color: AppColors.primaryBlue),
              title: const Text('체중 기록'),
              subtitle: const Text('현재 체중: 70kg'),
            ),
            const SizedBox(height: 24),
            // 로그아웃 버튼
            ElevatedButton(
              onPressed: () {
                // 로그아웃 로직 추가
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                '로그아웃',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}