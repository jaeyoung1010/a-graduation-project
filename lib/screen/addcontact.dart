import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../main.dart';

class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _relationship = '';
  String _phoneNumber = '';
  String _address = '';

  void _saveContact() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        // Firebase에 데이터 저장
        await FirebaseFirestore.instance.collection('addcontact').add({
          'name': _name,
          'relationship': _relationship,
          'phoneNumber': _phoneNumber,
          'address': _address,
        });
        Navigator.pop(context); // 저장 후 이전 화면으로 돌아가기
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('비상연락처 추가 완료!'))
        );
      } catch (e) {
        print(e); // 에러 출력
        // 에러가 발생했을 때 사용자에게 알리는 코드 추가
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('비상연락처 추가'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: '이름'),
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '관계'),
              onSaved: (value) {
                _relationship = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '전화번호'),
              onSaved: (value) {
                _phoneNumber = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '주소'),
              onSaved: (value) {
                _address = value!;
              },
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _saveContact();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}