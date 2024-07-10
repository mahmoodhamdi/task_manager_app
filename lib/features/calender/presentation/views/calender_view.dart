import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Calender View')),
    );
  }
}