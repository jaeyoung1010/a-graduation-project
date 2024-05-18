import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DementiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('치매예방에 관련된 정보를 알고싶어요'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DementiaDetailScreen1()),
              ),
              child: Image.asset(
                  'asset/images/DementiaDetailScreen1.png',
                  width: 600.0,
                  height: 100.0),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DementiaDetailScreen2()),
              ),
              child: Image.asset('assets/images/icon2.png',
                  width: 50.0, height: 50.0),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DementiaDetailScreen3()),
              ),
              child: Image.asset('assets/images/icon3.png',
                  width: 50.0, height: 50.0),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DementiaDetailScreen4()),
              ),
              child: Image.asset('assets/images/icon4.png',
                  width: 50.0, height: 50.0),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DementiaDetailScreen5()),
              ),
              child: Image.asset('assets/images/icon5.png',
                  width: 50.0, height: 50.0),
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------

class DementiaDetailScreen1 extends StatelessWidget {
  // 외부 링크를 열기 위한 함수
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('대한치매협회'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
              'asset/images/DementiaDetailScreen1.png'), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Text(
            '♣ 치매와 고령사회에 대한 양질의 정보제공\n'
                '♣ 교육 및 학술활동을 통한 치매 전문인력양성\n'
                '♣ 배움과 나눔을 통한 치매에 대한 올바른 이해와 치매 인식개선 활동\n'
                '♣ 회원간, 지역간, 기관간의 네트워크 강화와 활성화\n'
                '♣ 치매돌봄, 치매예방, 치매치료에 대한 비약물적 프로그램 연구개발 및 보급'),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'http://www.silverweb.or.kr/'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}

class DementiaDetailScreen2 extends StatelessWidget {
  // 외부 링크를 열기 위한 함수
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 화면 7'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
              'assets/images/your_image.png'), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Text('이것은 첫 번째 아이콘에 대한 상세 화면입니다.'),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'https://www.mohw.go.kr/menu.es?mid=a10712010000'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}

class DementiaDetailScreen3 extends StatelessWidget {
  // 외부 링크를 열기 위한 함수
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 화면 8'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
              'assets/images/your_image.png'), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Text('이것은 첫 번째 아이콘에 대한 상세 화면입니다.'),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'https://www.mohw.go.kr/menu.es?mid=a10712010000'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}

class DementiaDetailScreen4 extends StatelessWidget {
  // 외부 링크를 열기 위한 함수
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 화면 9'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
              'assets/images/your_image.png'), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Text('이것은 첫 번째 아이콘에 대한 상세 화면입니다.'),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'https://www.mohw.go.kr/menu.es?mid=a10712010000'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}

class DementiaDetailScreen5 extends StatelessWidget {
  // 외부 링크를 열기 위한 함수
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 화면 10'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
              'assets/images/your_image.png'), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Text('이것은 첫 번째 아이콘에 대한 상세 화면입니다.'),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'https://www.mohw.go.kr/menu.es?mid=a10712010000'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}