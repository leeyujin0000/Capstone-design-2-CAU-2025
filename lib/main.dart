import 'package:flutter/material.dart';
import 'screens/kakao_map_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kakao Map Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(), // 기본 홈화면
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('홈')),
      body: Center(
        child: ElevatedButton(
          child: Text('카카오맵 열기'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => KakaoMapScreen()),
            );
          },
        ),
      ),
    );
  }
}
