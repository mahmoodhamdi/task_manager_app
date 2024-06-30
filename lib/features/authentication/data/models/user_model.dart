import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String? photoUrl; // Optional attribute for profile photo URL
  final String? phoneNumber; // Optional attribute for phone number
  final bool emailVerified; // Indicates if the email is verified

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.phoneNumber,
    required this.emailVerified,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName ?? "",
      photoUrl: user.photoURL,
      phoneNumber: user.phoneNumber,
      emailVerified: user.emailVerified,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl ?? "",
      'phoneNumber': phoneNumber ?? "",
      'emailVerified': emailVerified,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'email': email,
      'username': displayName,
      'image': photoUrl,
      'phoneNumber': phoneNumber,
      'emailVerified': emailVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['id'],
      email: map['email'],
      displayName: map['username'],
      photoUrl: map['image'],
      phoneNumber: null, // Adjust this based on your actual data structure
      emailVerified: false, // Adjust this based on your actual data structure
    );
  }
}
