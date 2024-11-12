import 'package:flutter/material.dart';

class AddMealScreen extends StatelessWidget {
  final String mealType;
  final TextEditingController calorieController = TextEditingController();

  AddMealScreen({super.key, required this.mealType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$mealType 추가")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$mealType 칼로리 추가",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: calorieController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "칼로리 (kcal)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (calorieController.text.isNotEmpty) {
                    final calories = int.parse(calorieController.text);
                    Navigator.pop(context, calories);
                  }
                },
                child: const Text("저장"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}