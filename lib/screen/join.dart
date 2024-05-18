import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';




enum Gender { male, female }

class Join extends StatefulWidget {
  const Join({Key? key}) : super(key: key);

  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {
  Gender? _selectedGender;
  TextEditingController _birthYearController = TextEditingController(text: '1950');

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 35.0,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 100,
              ),

              Text(
                '처음이시군요!',
                style: TextStyle(fontSize: 40),
              ),

              Container(
                height: 70,
              ),

              SizedBox(height: 20),
              Container(
                width : 250,
                child : TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 5,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    labelText: '이름',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),

              Container(
                height: 20,
              ),

              SizedBox(height: 20),
              Container(
                width : 250,
                child : TextFormField(
                  controller: _birthYearController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    labelText: '태어난 해',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),

              Container(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGenderButton(Gender.male, '남자'),
                  SizedBox(width: 20), // 간격 조절
                  _buildGenderButton(Gender.female, '여자'),
                ],
              ),

              Container(
                height: 70,
              ),

              OutlinedButton(onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 각진 모양으로 만듭니다.
                  ),
                  minimumSize: Size(250, 60), // 버튼의 최소 크기를 조절합니다.
                ),
                child: Text('비상연락 등록',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.redAccent,
                ),
                ),
              ),
              Container(
                height: 20,
              ),

              Container(
                width : 250,
                child : Text('아들 010-1234-5678',
                    style: TextStyle(color: Colors.blue, fontSize: 30)),
              ),

              Container(
                height: 60,
              ),

              Container(
                width: 3000,
                child: Column(
                  children: [
                    Text('귀가 확인을 위해', style: TextStyle(fontSize: 30)),
                    Text('집 위치를 알려주세요', style: TextStyle(fontSize: 30)),

                    Container(
                      height: 20,
                    ),

                    OutlinedButton(onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // 각진 모양으로 만듭니다.
                        ),
                        minimumSize: Size(250, 60), // 버튼의 최소 크기를 조절합니다.
                      ),
                      child: Text('현재 장소',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                      ),
                    ),

                    Container(
                      height: 20,
                    ),

                    OutlinedButton(onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // 각진 모양으로 만듭니다.
                        ),
                        minimumSize: Size(250, 60), // 버튼의 최소 크기를 조절합니다.
                      ),
                      child: Text('검색하기',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                  ],
                ),
              ),


              Container(
                width : 250,
                child : Text('충청남도 아산시 배방읍 79번길 20',
                    style: TextStyle(color: Colors.blue, fontSize: 30)),
              ),

              Container(
                height: 50,
              ),

              ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 각진 모양으로 만듭니다.
                  ),
                  minimumSize: Size(250, 60), // 버튼의 최소 크기를 조절합니다.
                ),
                child: Text('완료',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                ),
              ),

              Container(
                height: 100,
              ),


            ],
          ),
        ),
      ),
    );
  }


  //성별버튼
  Widget _buildGenderButton(Gender gender, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // 버튼의 패딩 설정
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: _selectedGender == gender ? Colors.blueAccent : Colors.grey[200],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: _selectedGender == gender ? Colors.white : Colors.black,
          fontSize: 30,
        ),
      ),
    );
  }
}

