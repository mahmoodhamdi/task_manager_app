import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginWithEmailAndPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginWithEmailAndPasswordInitial
    extends LoginWithEmailAndPasswordState {}

class LoginWithEmailAndPasswordLoading
    extends LoginWithEmailAndPasswordState {}

class LoginWithEmailAndPasswordSuccess
    extends LoginWithEmailAndPasswordState {
  final User user;

  LoginWithEmailAndPasswordSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginWithEmailAndPasswordFailure
    extends LoginWithEmailAndPasswordState {
  final String error;

  LoginWithEmailAndPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
