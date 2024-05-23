import 'package:a_graduation_project_2/screen/join.dart';
import 'package:a_graduation_project_2/screen/memberedit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shake/shake.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:a_graduation_project_2/screen/welfare.dart';
import 'package:a_graduation_project_2/screen/dementia.dart';
import 'package:a_graduation_project_2/screen/welfarecenter.dart';
import 'package:a_graduation_project_2/screen/information_on_the_elderly.dart';
import 'package:a_graduation_project_2/screen/meeting_page.dart';
import 'package:a_graduation_project_2/screen/login.dart';
import 'package:a_graduation_project_2/screen/record.dart';
import 'package:a_graduation_project_2/screen/meeting_page.dart';
import 'addcontact.dart';
import 'contactlist.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    'asset/images/image1.png',
    'asset/images/image2.png',
    'asset/images/image3.png',
    'asset/images/image4.png',
    'asset/images/image5.png',
  ];

  final String userName = "사용자";
  final ScrollController _scrollController = ScrollController();
  PageController _pageController = PageController(); // 이미지 슬라이드를 위한 PageController
  Timer? _timer; // 이미지 자동 넘김을 위한 Timer

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    _startAutoScroll(); // 이미지 자동 스크롤 시작
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    _timer?.cancel(); // 페이지를 벗어날 때 타이머를 취소
    super.dispose();
  }

  _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Reached the bottom of the page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MeetingPage()),
      );
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.page!.round() == imageUrls.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$userName 님 안녕하세요', style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactsListScreen()),
                );
              },
              child: Icon(Icons.contact_page),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(imageUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Middle(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeetingPage()),
                );
              },
              child: Text(
                '오늘의 모임',
                style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(370, 100),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => information_on_the_elderly()),
                );
              },
              child: Text(
                '노인복지 정보',
                style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(370, 100),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordingScreen()),
                );
              },
              child: Text(
                '녹음 하기',
                style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(370, 100),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
            Icon(Icons.arrow_downward, size: 60),
            SizedBox(height: 500),
          ],
        ),
      ),
    );
  }
}


class Middle extends StatefulWidget {
  const Middle({Key? key}) : super(key: key);

  @override
  _MiddleState createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {
  int count = 0; // 걸음 수

  void onPhoneShake() {
    // 감지 후 실행할 함수
    setState(() {
      count = count + 1;
    });
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      shakeSlopTimeMS: 200,
      shakeThresholdGravity: 1.7,
      onPhoneShake: onPhoneShake,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            shape: BoxShape.circle,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '걸음 수',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'asset/images/logo.png',
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}

class UserInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원 정보'),
      ),
      body: Center(
        child: Text(
          '여기는 회원 정보 페이지입니다.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}