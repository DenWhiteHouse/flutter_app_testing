import 'package:flutter/material.dart';
import 'package:flutter_app_testing/presentation/pages/BookPage.dart';

import 'bloc/book_state_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: TextTheme(
            title: TextStyle(fontSize: 30, color: Colors.black),
            subtitle: TextStyle(fontSize: 20, color: Colors.black),
            body1: TextStyle(fontSize: 15, color: Colors.black)),
      ),
      home: BookWidget(),
    );
  }
}
