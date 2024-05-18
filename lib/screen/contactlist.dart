import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsListScreen extends StatefulWidget {
  @override
  _ContactsListScreenState createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비상연락처 목록'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('addcontact').orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(data['relationship']),
                    Text(data['address']), // 'address' 정보를 여기에 추가합니다.
                  ],
                ),
                trailing: Text(data['phoneNumber']),
                onTap: () {
                  // 여기에 아이템 클릭 시 수행할 작업 추가
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}