import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
});

}

class UsersScreen extends StatelessWidget
{
  List<UserModel> users = [
    UserModel(
        id: 5,
        name: 'ALI MOH',
        phone: '+966539437300',
    ),
    UserModel(
      id: 3,
      name: 'FAROIS ALI ',
      phone: '+966539437300',
    ),
    UserModel(
      id: 1,
      name: 'sfh jhjygt ',
      phone: '+96653943nbmgh7300',
    ),
    UserModel(
      id: 5,
      name: 'ALI MOH',
      phone: '+966539437300',
    ),
    UserModel(
      id: 6,
      name: 'ALI MOH',
      phone: '+966539437300',
    ),
    UserModel(
      id: 5,
      name: 'ALI MOH',
      phone: '+966539437300',
    ),
    UserModel(
      id: 5,
      name: 'ALI MOH',
      phone: '+966539437300',
    ),
    UserModel(
      id: 5,
      name: 'ALI MOH',
      phone: '+966539437300',
    ),
    UserModel(
      id: 5,
      name: 'ALI MOH',
      phone: '+966539437300',
    ),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USERS',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel users) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${users.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${users.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${users.phone}',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
