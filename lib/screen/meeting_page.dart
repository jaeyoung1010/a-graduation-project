import 'package:flutter/material.dart';

class MeetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘의 모임'),
      ),
      body: Center(
        child: Text(
          '오늘의 모임 페이지입니다.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

