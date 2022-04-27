import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {

  final int result;
  final int age;
  final bool isMale;

  BMIResultScreen({
    required this.result,
    required this.age,
    required this.isMale,
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Result',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Result : $result',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
