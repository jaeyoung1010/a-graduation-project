import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WelfareCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주변 복지관에 대한 정보를 알고싶어요'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen1()),
                ),
                child: Image.asset(
                    'asset/images/senior_site10.png',
                    width: 600.0,
                    height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen2()),
                ),
                child: Image.asset('asset/images/senior_site11.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen3()),
                ),
                child: Image.asset('asset/images/senior_site17.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen4()),
                ),
                child: Image.asset('asset/images/senior_site13.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen5()),
                ),
                child: Image.asset('asset/images/senior_site18.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen6()),
                ),
                child: Image.asset('asset/images/senior_site19.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen7()),
                ),
                child: Image.asset('asset/images/senior_site16.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen8()),
                ),
                child: Image.asset('asset/images/senior_site12.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen9()),
                ),
                child: Image.asset('asset/images/senior_site14.png',
                    width: 600.0, height: 100.0),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelfareCenterDetailScreen10()),
                ),
                child: Image.asset('asset/images/senior_site15.png',
                    width: 600.0, height: 100.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//------------------------------------------------------------------------------

class WelfareCenterDetailScreen1 extends StatelessWidget {
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
        title: Text('양재노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen1.png',
            width: 200.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '서초구립 양재노인종합복지관은 사회복지법인 기아대책의 설립이념과 사회복지 철학을 바탕으로 어르신들이 건강하고 행복한 노후를 보내고 지역사회에서 세대가 공감하는 효도문화 계승을 위해 참신하고 전문화된 노인복지 서비스를 제공하는 노인복지전문기관입니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('https://www.seochosenior.org/'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen2 extends StatelessWidget {
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
        title: Text('은평노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen1.png',
            width: 200.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '서초구립 양재노인종합복지관은 사회복지법인 기아대책의 설립이념과 사회복지 철학을 바탕으로 어르신들이 건강하고 행복한 노후를 보내고 지역사회에서 세대가 공감하는 효도문화 계승을 위해 참신하고 전문화된 노인복지 서비스를 제공하는 노인복지전문기관입니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('https://www.seochosenior.org/'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen3 extends StatelessWidget {
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
        title: Text('마포노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen3.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '서울시립마포노인종합복지관은 이랜드복지재단이 서울시로부터 위탁받아 운영하는 노인복지전문기관으로서 어르신들의 건강하고 안정된 노후생활을 돕기 위해 다양한 복지서비스를 제공하고 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('http://senior21.or.kr/'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen4 extends StatelessWidget {
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
        title: Text('중랑노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen4.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '사회복지법인 유린보은동산이 서울시로부터 위탁운영하고 있는 시립중랑노인종합복지관은 노인복지전문기관으로서 어르신들의 건강하고 안정된 노후생활을 돕기 위해 다양한 복지서비스를 제공하고 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('http://www.eorsin.com/'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen5 extends StatelessWidget {
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
        title: Text('강서어르신종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen5.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '강서노인종합복지관은 비가 오나 눈이오나 한결같은 관심과 열정으로 이용해 주시는 어르신들과 이웃의 행복을 위해 기꺼이 사랑을 나누어 주시는 지역사회의 많은 자원봉사자와 후원자 여러분들, 강서노인복지의 터전을 마련해준 학교법인 한국그리스도의교회학원 및 정책적으로 이끌어주시는 서울시와 관계기관, 그리고 서울시노인종합복지관들이 함께 어우러져 어르신복지를 디자인하고 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('http://www.gangseosenior.or.kr/'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen6 extends StatelessWidget {
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
        title: Text('성북노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen6.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '성북노인종합복지관은 2019년 8월부터 사회복지법인 한기장복지재단이 위탁운영하고 있으며, 어르신들과 직원들이 공명하여 함께 힘 있게 실천하기 위해 노력하고 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('http://www.sbnoin.or.kr/'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen7 extends StatelessWidget {
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
        title: Text('노원노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/senior_site16.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '노원노인종합복지관은 노인복지전문기관으로서 어르신들의 건강하고 안정된 노후생활을 돕기 위해 다양한 복지서비스를 제공하고 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('https://www.nowonsenior.or.kr/index.php'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen8 extends StatelessWidget {
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
        title: Text('송파노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen8.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '송파구에서 설립한 구립송파노인종합복지관은 1996년 개관이래 복지관 운영주체인 청암노인복지재단의 미션을 기반으로 “행복한 노년”을 보낼 수 있도록 다양하고 전문적인 서비스를 제공하여 어르신과 가정 그리고 지역사회의 밝고 행복한 삶을 달성하는 것을 목표로 하고 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('https://www.song-pa.or.kr/index.php'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen9 extends StatelessWidget {
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
        title: Text('대전서구노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen9.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '대전 서구청이 설립하고 사회복지법인 대한불교조계종 사회복지재단이 위탁운영을 맡은 서구노인복지관은 1997년 3월 15일 개관한 이래 23년동안 전국적으로 우수한 모범기관으로 자리매김하며 노인복지의 선봉장이 되어 왔습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('https://www.woorinoin.or.kr/xe/'),
          ),
        ],
      ),
    );
  }
}

class WelfareCenterDetailScreen10 extends StatelessWidget {
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
        title: Text('광주동구노인종합복지관'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // 상단 이미지
          Image.asset(
            'asset/images/WelfareCenterDetailScreen10.png',
            width: 400.0,
            height: 200.0,
          ),
          // 중간 텍스트에 왼쪽, 오른쪽 여백 추가
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0), // 여기에 여백을 지정합니다.
            child: Text(
              '동구노인종합복지관은 1997년 7월 1일에 개관하여 지금까지 어르신들을 사랑과 정성으로 섬기고 있습니다.빈곤과 질병 그리고 외로움과 사회적 역할이 없어 힘들어하는 어르신들이 날로 늘어가는 이 시대에경제적으로 어려운 어르신들에게는 풍요로운 노후를, 질병이 있는 어르신들에게는 건강한 노후를,정서적으로 외로운 어르신들에게는 신나는 노후를, 아름다운 마무리를 원하는 어르신들에게는 존엄한 노후를 만들어 드리기 위해 최선을 다하고 있습니다.',
              style: TextStyle(fontSize: 30),
            ),
          ),
          // 하단 큰 아이콘
          IconButton(
            icon: Icon(Icons.link, size: 48),
            onPressed: () =>
                _launchUrl('http://www.noin.or.kr/index.php'),
          ),
        ],
      ),
    );
  }
}