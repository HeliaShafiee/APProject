import 'package:flutter/material.dart';

void main() {
  runApp(const BankOraApp());
}
class BankOraApp extends StatelessWidget{
  const BankOraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BankOra',
      home: const SignInScreen(),
    );
  }
}


