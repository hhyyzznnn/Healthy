import 'package:flutter/material.dart';
import 'package:healthy/constants/app_bar.dart';
import 'package:healthy/constants/colors.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: '식단'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 오늘의 칼로리 상태
            const Text(
              '오늘 하루',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 120,
              color: Colors.grey[200], // 데모용 그래프 영역
              child: const Center(child: Text('칼로리 상태 그래프')),
            ),
            const SizedBox(height: 16),
            // 식사 기록 박스
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  _buildMealBox('아침', Icons.breakfast_dining),
                  _buildMealBox('점심', Icons.lunch_dining),
                  _buildMealBox('저녁', Icons.dinner_dining),
                  _buildMealBox('간식', Icons.icecream),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealBox(String mealType, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppColors.primaryBlue),
            const SizedBox(height: 8),
            Text(
              mealType,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('추가하기', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}