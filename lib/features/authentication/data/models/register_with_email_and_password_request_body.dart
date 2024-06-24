class RegisterWithEmailAndPasswordRequestBody {
  final String email;
  final String password;
  final String username;
  RegisterWithEmailAndPasswordRequestBody({
    required this.email,
    required this.username,
    required this.password,
  });
}
