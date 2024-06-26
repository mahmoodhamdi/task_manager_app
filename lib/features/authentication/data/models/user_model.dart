
class UserModel {
  final String id;
  final String email;
  final String username;
  final String? image;
  final String createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    this.image,
    required this.createdAt,
  });

  // Convert a User object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'image': image,
      'created_at': createdAt,
    };
  }

  // Extract a User object from a Map object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      image: map['image'],
      createdAt: map['created_at'],
    );
  }
}
