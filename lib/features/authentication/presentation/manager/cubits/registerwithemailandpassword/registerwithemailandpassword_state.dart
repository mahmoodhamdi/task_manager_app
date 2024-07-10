import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterWithEmailAndPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterWithEmailAndPasswordInitial extends RegisterWithEmailAndPasswordState {}

class RegisterWithEmailAndPasswordLoading extends RegisterWithEmailAndPasswordState {}

class RegisterWithEmailAndPasswordSuccess extends RegisterWithEmailAndPasswordState {
  final User user;

  RegisterWithEmailAndPasswordSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class RegisterWithEmailAndPasswordFailure extends RegisterWithEmailAndPasswordState {
  final String error;

  RegisterWithEmailAndPasswordFailure(this.error);

  @override
  List<Object?> get props => [error];
}
