import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:a_graduation_project_2/screen/welfare.dart';
import 'package:a_graduation_project_2/screen/dementia.dart';
import 'package:a_graduation_project_2/screen/welfarecenter.dart';


class information_on_the_elderly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('무엇을 도와드릴까요?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelfareScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('노인 복지와 관련된 정보를 알고싶어요',
                        style: TextStyle(fontSize: 25.0)),
                    Image.asset('asset/images/welfare.png',
                        width: 200.0, height: 200.0), // 이미지 파일로 변경
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('주변 복지관에 대한 정보를 알고싶어요',
                        style: TextStyle(fontSize: 25.0)),
                    Image.asset('asset/images/welfarecenter.png',
                        width: 200.0, height: 200.0), // 이미지 파일로 변경
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DementiaScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('치매예방에 관련된 정보를 알고싶어요',
                        style: TextStyle(fontSize: 25.0)),
                    Image.asset('asset/images/dementia.png',
                        width: 200.0, height: 200.0), // 이미지 파일로 변경
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}