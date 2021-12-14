import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final int birthYear;
  const SecondPage({Key? key, required this.birthYear}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int age = DateTime.now().year - birthYear;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('your age is $age'),
      ),
    );
  }
}
