import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? text;

  int dayDate = DateTime.now().day;
  int monthDate = DateTime.now().month;
  int yearDate = DateTime.now().year;

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();

    text = null;
  }

  void _showDatePicker() {
    setState(() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2013),
        lastDate: DateTime(2025),
        confirmText: text,
        onDatePickerModeChange: (value) {
          date = value.toString() as DateTime;
        },
      );
    });

    // String date = ''
    //     '${yearDate.toInt()}/${monthDate.toString()}/${dayDate.toString()}';
    // setState(() {
    //   text = date.toString();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text for show date
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Text(
                text ?? 'Please Press the below button',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 48),

            // choose date button
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: _showDatePicker,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  child: Center(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
