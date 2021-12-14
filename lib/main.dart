// ignore_for_file: must_be_immutable

import 'package:age_calculator/second_second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.pinkAccent[100],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  TextEditingController birthYear = TextEditingController();

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('birth year!'),
                    labelStyle: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                  controller: widget.birthYear,
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    (widget.birthYear.text.isNotEmpty)
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  birthYear: int.parse(widget.birthYear.text),
                                )))
                        : () {};
                  },
                  child: const Text('Generate'))
            ],
          ),
        ),
      ),
    );
  }
}
