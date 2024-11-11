import 'package:flutter/material.dart';
import 'package:healthy/constants/app_bar.dart';
import 'package:healthy/constants/colors.dart';
import 'notification.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: '헬띠', actions: [
        Padding(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationsScreen()));
                }))
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 환영 메시지 및 오늘의 목표
            const Text(
              '안녕하세요, [사용자 이름]님!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('오늘의 목표: 2000kcal 섭취, 60분 운동'),

            // 메인 통계 카드
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('칼로리 섭취', '1500/2000kcal', Icons.local_fire_department),
                _buildStatCard('운동 시간', '30/60분', Icons.fitness_center),
                _buildStatCard('체중 변화', '70kg', Icons.monitor_weight)
              ],
            ),

            // 빠른 기록 버튼
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      // 식단 추가 페이지로 이동
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                    ),
                    child: const Text('식단 추가하기', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      // 운동 추가 페이지로 이동
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                    ),
                    child: const Text('운동 추가하기', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),

            // 추천 섹션
            const SizedBox(height: 24),
            const Text(
              '추천 식단',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('저칼로리 아침 식단 추천: 오트밀과 과일'),

            const SizedBox(height: 16),
            const Text(
              '추천 운동',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('30분 조깅으로 상쾌한 하루를 시작하세요!'),

            // 진행 상황 요약
            const SizedBox(height: 24),
            const Text(
              '진행 상황',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              color: Colors.grey[200], // 그래프 표시 영역 (데모용)
              child: const Center(child: Text('체중 변화 그래프 표시')),
            ),
          ],
        ),
      ),
    );
  }

  // 통계 카드 위젯 생성 함수
  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primaryBlue, size: 40),
              const SizedBox(height: 8),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
