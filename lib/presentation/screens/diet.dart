import 'package:flutter/material.dart';
import 'package:healthy/constants/app_bar.dart';
import 'diet/add_meal.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  Map<String, int> mealCalories = {
    "아침": 0,
    "점심": 0,
    "저녁": 0,
    "간식": 0,
  };

  void updateMealCalories(String mealType, int calories) {
    setState(() {
      mealCalories[mealType] = calories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: '식단'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "오늘의 식단",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...mealCalories.entries.map((entry) {
              String mealType = entry.key;
              int calories = entry.value;
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(mealType, style: const TextStyle(fontSize: 20)),
                  subtitle: Text(
                    calories > 0 ? "총 칼로리: $calories kcal" : "칼로리 정보 없음",
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

                      if (result != null) {
                        updateMealCalories(mealType, result);
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