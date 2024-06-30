import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Profile View')),
    );
  }
}