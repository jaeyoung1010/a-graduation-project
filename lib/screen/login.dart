import 'package:flutter/material.dart';
import 'package:a_graduation_project_2/screen/join.dart';


class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Image.asset(
      'asset/images/logo.png',
      width: 150,
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(),
          Container(
            width: 300, // 텍스트 필드의 폭 조정
            child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 11,
                style: TextStyle(fontSize: 30), // 텍스트 스타일 수정
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // 텍스트 입력 영역의 패딩 조정
                  border: OutlineInputBorder(),
                  labelText: '1. 휴대폰 번호',
                  labelStyle: TextStyle(fontSize: 30),
                )
            ),
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // 각진 모양으로 만듭니다.
              ),
              minimumSize: Size(300, 60), // 버튼의 최소 크기를 조절합니다.
            ),
            child: Text('2. 문자 받기',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            width: 300, // 텍스트 필드의 폭 조정
            child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                style: TextStyle(fontSize: 30), // 텍스트 스타일 수정
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // 텍스트 입력 영역의 패딩 조정
                  border: OutlineInputBorder(),
                  labelText: '3. 문자받은 숫자',
                  labelStyle: TextStyle(fontSize: 30),
                )
            ),
          ),
          Container(
            height: 10,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Join()),
            );
          },
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // 각진 모양으로 만듭니다.
              ),
              minimumSize: Size(300, 60), // 버튼의 최소 크기를 조절합니다.
            ),
            child: Text('4. 완료',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            ),
          ),
        ],
      ),
    );
  }
}