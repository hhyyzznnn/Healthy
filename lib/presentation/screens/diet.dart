import 'package:flutter/material.dart';
import 'package:healthy/constants/app_bar.dart';
import 'diet/add_meal.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  // 각 식사의 총 칼로리 및 탄수화물, 단백질, 지방 정보 저장
  Map<String, Map<String, int>> mealNutrition = {
    "아침": {"calories": 0, "carbs": 0, "protein": 0, "fat": 0},
    "점심": {"calories": 0, "carbs": 0, "protein": 0, "fat": 0},
    "저녁": {"calories": 0, "carbs": 0, "protein": 0, "fat": 0},
    "간식": {"calories": 0, "carbs": 0, "protein": 0, "fat": 0},
  };

  void updateMealNutrition(String mealType, Map<String, int> nutrition) {
    setState(() {
      mealNutrition[mealType] = nutrition;
    });
  }

  // 전체 총 칼로리와 영양소를 계산하는 함수
  Map<String, int> getTotalNutrition() {
    int totalCalories = 0;
    int totalCarbs = 0;
    int totalProtein = 0;
    int totalFat = 0;

    mealNutrition.values.forEach((nutrition) {
      totalCalories += nutrition["calories"]!;
      totalCarbs += nutrition["carbs"]!;
      totalProtein += nutrition["protein"]!;
      totalFat += nutrition["fat"]!;
    });

    return {
      "calories": totalCalories,
      "carbs": totalCarbs,
      "protein": totalProtein,
      "fat": totalFat,
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, int> totalNutrition = getTotalNutrition();

    return Scaffold(
      appBar: buildAppBar(title: '식단'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "오늘의 식단",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // 총 칼로리 및 영양소 요약
            Card(
              color: Colors.grey[200],
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "총 칼로리: ${totalNutrition["calories"]} kcal",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "탄수화물: ${totalNutrition["carbs"]}g, "
                          "단백질: ${totalNutrition["protein"]}g, "
                          "지방: ${totalNutrition["fat"]}g",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 각 식사별 카드
            ...mealNutrition.entries.map((entry) {
              String mealType = entry.key;
              Map<String, int> nutrition = entry.value;
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(mealType, style: const TextStyle(fontSize: 20)),
                  subtitle: Text(
                    nutrition["calories"]! > 0
                        ? "총 칼로리: ${nutrition["calories"]} kcal\n"
                        "탄수화물: ${nutrition["carbs"]}g, 단백질: ${nutrition["protein"]}g, 지방: ${nutrition["fat"]}g"
                        : "영양 정보 없음",
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMealScreen(mealType: mealType),
                        ),
                      );

                      if (result != null && result is Map<String, int>) {
                        updateMealNutrition(mealType, result);
                      }
                    },
                    child: const Text("추가"),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}