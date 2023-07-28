import 'package:assigment1/screens/listing_screen/homeui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const My_assigment());
}

class My_assigment extends StatelessWidget {
  const My_assigment({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_screen(),
    );
  }
}
