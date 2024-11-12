import 'package:flutter/material.dart';

class RoutineSelectionScreen extends StatelessWidget {
  final List<String> routines = [
    '가슴, 어깨, 삼두',
    '등, 이두',
    '하체, 코어',
    '전신 운동',
  ];

  RoutineSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('오늘의 루틴 선택')),
      body: ListView.builder(
        itemCount: routines.length,
        itemBuilder: (context, index) {
          final routine = routines[index];
          return ListTile(
            title: Text(routine),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, routine);
              },
              child: const Text('선택'),
            ),
          );
        },
      ),
    );
  }
}