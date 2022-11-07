import 'package:flutter/material.dart';
import 'package:tripler/pe1.dart';

void main() {
  runApp(MyApp());
}
//test
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(body: Page1()),
    );
  }
}
