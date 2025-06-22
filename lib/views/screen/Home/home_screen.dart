import 'package:flutter/material.dart';
import 'package:wellbyn/views/base/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body:const Center(
     child: Text(
       "Welcome to HomeScreen!",
       style: TextStyle(fontSize: 24,color: Colors.blue),
     ),
   ),
    );

  }
}
