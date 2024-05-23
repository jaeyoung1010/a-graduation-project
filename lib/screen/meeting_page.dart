import 'package:flutter/material.dart';

class MeetingPage extends StatefulWidget {
  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<Meeting> meetings = [
    Meeting(time: "세출호 11시", title: "강아지 산책", participants: 2),
    Meeting(time: "세출호 2시", title: "오후 산책", participants: 1, isParticipating: true),
    Meeting(time: "세출호 4시", title: "강아지 산책", participants: 3),
    Meeting(time: "세출호 6시", title: "저녁 산책", participants: 0),
  ];

  void _toggleParticipation(int index) {
    setState(() {
      meetings[index].isParticipating = !meetings[index].isParticipating;
      if (meetings[index].isParticipating) {
        meetings[index].participants += 1;
      } else {
        meetings[index].participants -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '오늘의 모임',
          style: TextStyle(fontSize: 24), // 글씨 크기 키움
        ),
      ),
      body: ListView.builder(
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // 패딩 조정
            title: Text(
              '${meetings[index].time} ${meetings[index].title}\n(참여인원: ${meetings[index].participants}명)',
              style: TextStyle(fontSize: 18), // 글씨 크기 키움
            ),
            trailing: ElevatedButton(
              onPressed: () => _toggleParticipation(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: meetings[index].isParticipating ? Colors.blue : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // 버튼 크기 조정
                textStyle: TextStyle(fontSize: 16), // 버튼 텍스트 크기 키움
              ),
              child: Text(meetings[index].isParticipating ? '참여함' : '참여하기'),
            ),
          );
        },
      ),
    );
  }
}

class Meeting {
  final String time;
  final String title;
  int participants;
  bool isParticipating;

  Meeting({
    required this.time,
    required this.title,
    required this.participants,
    this.isParticipating = false,
  });
}
