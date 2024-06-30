import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial
    extends UserState {}

class UserLoading
    extends UserState {}

class UserLoaded
    extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserFailure
    extends UserState {
  final String error;

  UserFailure(this.error);

  @override
  List<Object?> get props => [error];
}
