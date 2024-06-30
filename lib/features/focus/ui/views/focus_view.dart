import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FocusView extends StatelessWidget {
  const FocusView({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Focus View')),
    );
  }
}