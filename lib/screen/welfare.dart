import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelfareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('노인 복지와 관련된 정보를 알고싶어요'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelfareDetailScreen1()),
              ),
              child: Image.asset('asset/images/senior_site01.png',
                  width: 600.0, // 크기 조정
                  height: 100.0), // 크기 조정
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelfareDetailScreen2()),
              ),
              child: Image.asset('asset/images/senior_site02.png',
                  width: 600.0, // 크기 조정
                  height: 100.0), // 크기 조정
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelfareDetailScreen3()),
              ),
              child: Image.asset('asset/images/senior_site03.png',
                  width: 600.0, // 크기 조정
                  height: 100.0), // 크기 조정
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelfareDetailScreen4()),
              ),
              child: Image.asset('asset/images/senior_site04.png',
                  width: 600.0, // 크기 조정
                  height: 100.0), // 크기 조정
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelfareDetailScreen5()),
              ),
              child: Image.asset('asset/images/senior_site05.png',
                  width: 600.0, // 크기 조정
                  height: 100.0), // 크기 조정
            ),
          ],
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------

class WelfareDetailScreen1 extends StatelessWidget {
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
        title: Text('보건복지부'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/ministry_of_health_and_welfare_logo.png',
            width: 200.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '보건복지부는 한국의 노인복지 전용 포털을 운영하고 있습니다'
                  '이 포털은 노인 인구 지원을 목표로 하는다양한 프로그램, 서비스, 정책 및 계획에 대한 정보를 제공합니다.'
                  '여기에는 의료, 사회 복지, 재정 지원 등이 포함됩니다.대표적인 노인정책으로는 치매검진사업,노인맞춤돌봄서비스,노인주거복지시설 등이 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('https://www.mohw.go.kr/menu.es?mid=a10712010000'),
          ),
        ],
      ),
    );
  }
}

class WelfareDetailScreen2 extends StatelessWidget {
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
        title: Text('대한노인회'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/Korean_Senior_Citizens_associaltion.png',
            width: 200.0,
            height: 200.0,
          ), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '대한노인회는 대한민국의 노인들의 권익을 보호하고, 노인들의 복지 향상을 위해 다양한 활동을 하는 비영리 조직입니다.'
                  '노인들의 사회 참여를 증진하고, 건강하고 활기찬 노후 생활을 지원하기 위한 다양한 프로그램과 서비스를 제공합니다.'
                  '대한노인회는 노인 교육, 건강 증진, 문화 활동, 자원봉사 프로그램 등을 운영하며, 노인의 권익 보호를 위한 정책 제안과 캠페인도 진행합니다. 또한, 지역사회 내에서 노인들이 서로 소통하고 교류할 수 있는 기회를 마련하며, 노인들이 사회의 존경받는 일원으로서 그들의 역할을 할 수 있도록 지원하는 데 중점을 둡니다..',
              style: TextStyle(fontSize: 23),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'http://koreapeople.or.kr/'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}

class WelfareDetailScreen3 extends StatelessWidget {
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
        title: Text('한국노인복지중앙회'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/elder.png',
            width: 200.0,
            height: 200.0,
          ), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '사단법인 한국노인복지중앙회는 회원시설의 합리적 운영을 위한 제반사항을 지원하고 회원 간의 유대강화 및 권익을 신장하며 정부시책에 부응하여 한국노인복지 발전에 기여함을 목적으로 하고있습니다. '
                  '산적한 노인복지 현안을 풀어가기 위해 회원 여러분의 말씀에 귀 기울이고 정확한 정보를 신속히 전달하는 시스템을 제공합니다.',
              style: TextStyle(fontSize: 23),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'http://www.elder.or.kr/'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}

class WelfareDetailScreen4 extends StatelessWidget {
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
        title: Text('한국재가노인복지협회'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/kacold.png',
            width: 200.0,
            height: 200.0,
          ), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(
              '한국재가노인복지협회는 한국에서 노인복지 서비스를 개선하고자 하는 목적으로 설립된 비영리 단체입니다. 주된 목적은 재가 노인(자택에 거주하는 노인)에게 다양한 복지 서비스와 지원을 제공하는 것입니다. 이 협회는 노인들이 자신의 집에서 품위 있고 독립적인 삶을 유지할 수 있도록 돕는 것을 목표로 활동합니다.',
              style: TextStyle(fontSize: 23),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'http://www.kacold.or.kr/'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}

class WelfareDetailScreen5 extends StatelessWidget {
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
        title: Text('한국헬프에이지'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/help.png',
            width: 200.0,
            height: 200.0,
          ), // 'your_image.png'를 자신의 이미지 경로로 변경하세요.
          // 중간 텍스트
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(
              '한국헬프에이지(HelpAge Korea)는 노인들의 권리 증진과 복지 향상을 목표로 하는 국제 노인복지 단체 HelpAge International의 한국 지부입니다. HelpAge International은 전 세계 노인들의 삶의 질을 개선하기 위해 노력하는 비정부 기구(NGO)로, 여러 국가에서 노인 복지 증진을 위한 다양한 프로젝트와 활동을 진행하고 있습니다.',
              style: TextStyle(fontSize: 23),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48), // 아이콘 크기 조정
            onPressed: () => _launchUrl(
                'https://www.helpage.or.kr/'), // 'https://www.example.com'를 원하는 링크로 변경하세요.
          ),
        ],
      ),
    );
  }
}
