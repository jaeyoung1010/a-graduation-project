import 'package:a_graduation_project_2/screen/addcontact.dart';
import 'package:a_graduation_project_2/screen/join.dart';
import 'package:a_graduation_project_2/screen/mainpage.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색 설정
      body: Stack(
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Container(
                width: 200, // 이미지 크기 설정
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/logo.png'), // 이미지 경로
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter, // 텍스트를 하단 중앙에 배치
            child: Padding(
              padding: EdgeInsets.only(bottom: 30), // 하단 여백 설정
              child: Text(
                "20213139 박예진\n"
                "20212249 최재영\n"
                "20213138 김예영\n"
                "20210832 김효나\n", // 텍스트 내용
                style: TextStyle(
                  fontSize: 24, // 텍스트 크기
                  color: Colors.white, // 텍스트 색상
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _registerUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // 회원가입 성공 시 SnackBar 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("회원가입 성공!"),
            backgroundColor: Colors.green,
          ),
        );

        print("회원가입 성공: ${userCredential.user}");
      } catch (e) {
        // 회원가입 실패 시 SnackBar 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("회원가입 실패 비밀번호가 너무 짧아요!"),
            backgroundColor: Colors.red,
          ),
        );

        print("회원가입 실패: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('회원가입')),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: '이메일',
              hintText: '생년월일을 입력하세요.@silver.com',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: '비밀번호',
              hintText: '비밀번호를 6자리 이상 입력하세요',
            ),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              _registerUser();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContactScreen()),
              );
            },
            child: Text('회원가입'),
          ),
          TextButton(
            child: Text('회원가입이 완료됐나요? 그러면 로그인하러가요!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 이메일과 비밀번호 입력을 위한 컨트롤러
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('로그인'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: '이메일',
              hintText: '생년월일을 입력하세요.@silver.com', // 힌트 추가
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: '비밀번호',
              hintText: '비밀번호를 입력하세요', // 힌트 추가
            ),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: _login, // 로그인 버튼이 눌렸을 때 _login 함수 호출
            child: Text('로그인'),
          ),
          TextButton(
            child: Text('회원이 아니신가요? 회원가입하러가요!'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  void _login() async {
    try {
      // 로그인 로직 구현. 예를 들어 Firebase를 사용하는 경우 아래와 같습니다.
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        // 로그인에 성공했다면 HomePage로 이동하고, 성공 메시지를 보여줍니다.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );

        // 로그인 성공 Snackbar 메시지
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("로그인 성공!"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      // 로그인 실패 처리. 오류 메시지를 사용자에게 보여줍니다.
      // 로그인 실패 Snackbar 메시지
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("로그인 실패"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    // 컨트롤러 리소스 해제
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
