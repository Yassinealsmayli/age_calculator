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
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        backgroundColor: Colors.pink[100],
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
  datePickerChoose() async {
    DateTime selected = DateTime.now();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(1950),
              lastDate: DateTime(DateTime.now().year),
              initialDate: DateTime.now(),
              selectedDate: selected,
              onChanged: (DateTime dateTime) {
                widget.birthYear.text = "${dateTime.year}";
                // close the dialog when year is selected.
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  prefixIcon: Icon(Icons.calendar_today_rounded),
                  label: Text(
                    'birth year!',
                    style: TextStyle(color: Colors.purple),
                    textAlign: TextAlign.center,
                  ),
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
                keyboardType: TextInputType.number,
                controller: widget.birthYear,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    (widget.birthYear.text.isNotEmpty)
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondPage(
                                  birthYear: int.parse(widget.birthYear.text),
                                )))
                        : () {};
                  },
                  child: const Text('Generate')),
              TextButton(
                  onPressed: () {
                    datePickerChoose();
                  },
                  child: const Text('get year from date picker!'))
            ],
          ),
        ),
      ),
    );
  }
}
