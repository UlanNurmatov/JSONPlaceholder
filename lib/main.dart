import 'package:flutter/material.dart';
import 'package:test_app/view/all_users/all_users.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersScreen(title: 'Users'),
    );
  }
}
