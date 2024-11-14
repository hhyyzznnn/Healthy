import 'package:flutter/material.dart';

class AddMealScreen extends StatefulWidget {
  final String mealType;

  const AddMealScreen({super.key, required this.mealType});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  Map<String, int> nutritionTotals = {"calories": 0, "carbs": 0, "protein": 0, "fat": 0};

  // 예제 음식 데이터 (각 음식의 칼로리, 탄수화물, 단백질, 지방)
  final List<Map<String, dynamic>> foodItems = [
    {"name": "밥", "calories": 300, "carbs": 45, "protein": 6, "fat": 1},
    {"name": "닭가슴살", "calories": 150, "carbs": 0, "protein": 31, "fat": 3},
    {"name": "샐러드", "calories": 50, "carbs": 5, "protein": 2, "fat": 1},
    // 추가 음식 데이터를 여기에 추가할 수 있습니다
  ];

  void addFoodNutrition(Map<String, int> foodNutrition) {
    setState(() {
      nutritionTotals["calories"] = (nutritionTotals["calories"] ?? 0) + foodNutrition["calories"]!;
      nutritionTotals["carbs"] = (nutritionTotals["carbs"] ?? 0) + foodNutrition["carbs"]!;
      nutritionTotals["protein"] = (nutritionTotals["protein"] ?? 0) + foodNutrition["protein"]!;
      nutritionTotals["fat"] = (nutritionTotals["fat"] ?? 0) + foodNutrition["fat"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.mealType} 추가')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final food = foodItems[index];
                return ListTile(
                  title: Text(food["name"]),
                  subtitle: Text(
                      '칼로리: ${food["calories"]} kcal, 탄수화물: ${food["carbs"]}g, 단백질: ${food["protein"]}g, 지방: ${food["fat"]}g'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      addFoodNutrition({
                        "calories": food["calories"],
                        "carbs": food["carbs"],
                        "protein": food["protein"],
                        "fat": food["fat"],
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  '현재 총 칼로리: ${nutritionTotals["calories"]} kcal\n'
                      '탄수화물: ${nutritionTotals["carbs"]}g, 단백질: ${nutritionTotals["protein"]}g, 지방: ${nutritionTotals["fat"]}g',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, nutritionTotals);
                  },
                  child: const Text("저장"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}