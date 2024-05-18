import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '회원정보 수정',
      home: MemberEditScreen(),
    );
  }
}

class MemberEditScreen extends StatefulWidget {
  @override
  _MemberEditScreenState createState() => _MemberEditScreenState();
}

class _MemberEditScreenState extends State<MemberEditScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  String _selectedGender = 'Female'; // 초기값: 여자
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _guardianNameController = TextEditingController();
  TextEditingController _guardianPhoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            '회원정보 수정',
            style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildFormField('이름', _nameController, '홍길동'),
                _buildGenderDropdown(),
                _buildFormField('전화번호', _phoneController, '010 1234 5678'),
                _buildFormField('보호자 이름', _guardianNameController, '홍길동'),
                _buildFormField('보호자 번호', _guardianPhoneController, '010 1234 5678'),
                _buildFormField('주거지', _addressController, '아산시 배방읍'),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    _validateAndSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    textStyle: TextStyle(fontSize: 25.0),
                  ),
                  child: Text('박수 소리 설정'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    print('저장');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    textStyle: TextStyle(fontSize: 25.0),
                  ),
                  child: Text('저장'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, String hintText) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 19.0),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
              ),
              validator: (value) {
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              '성별',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 19.0),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
              items: <String>['Female', 'Male'].map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender == 'Female' ? '여자' : '남자', style: TextStyle(fontSize: 20.0)),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: '성별 선택',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateAndSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _updateMemberInfo();
    }
  }

  void _updateMemberInfo() {
    String name = _nameController.text;
    String gender = _selectedGender == 'Female' ? '여자' : '남자';
    String phone = _phoneController.text;
    String guardianName = _guardianNameController.text;
    String guardianPhone = _guardianPhoneController.text;
    String address = _addressController.text;

    print('이름: $name, 성별: $gender, 전화번호: $phone, '
        '보호자 이름: $guardianName, 보호자 전화번호: $guardianPhone, '
        '주거지: $address');

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _guardianNameController.dispose();
    _guardianPhoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
