import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('알림'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, // 임시로 10개의 알림을 표시
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: Text('알림 제목 ${index + 1}'),
              subtitle: Text('이것은 알림의 세부사항입니다. ${index + 1}번째 알림입니다.'),
              trailing: IconButton(
                icon: Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  // 알림 삭제 기능 구현 가능
                },
              ),
              onTap: () {
                // 알림을 눌렀을 때 동작 추가 가능
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('알림 ${index + 1}을(를) 눌렀습니다.')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}