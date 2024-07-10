import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_manager_app/core/errors/exceptions.dart';
import 'package:task_manager_app/core/errors/firebase_auth_exceptions.dart';
import 'package:task_manager_app/core/errors/firebase_exceptions.dart';
import 'package:task_manager_app/core/errors/platform_exceptions.dart';
import 'package:task_manager_app/core/utils/logger.dart';
import 'package:task_manager_app/features/authentication/data/models/register_with_email_and_password_request_body.dart';
import 'package:task_manager_app/features/authentication/data/repos/auth_repo.dart';
import 'package:task_manager_app/features/authentication/presentation/manager/cubits/registerwithemailandpassword/registerwithemailandpassword_state.dart';

class RegisterWithEmailAndPasswordCubit
    extends Cubit<RegisterWithEmailAndPasswordState> {
  final AuthRepo _authRepo = GetIt.instance<AuthRepo>();
  RegisterWithEmailAndPasswordCubit()
      : super(RegisterWithEmailAndPasswordInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> registerWithEmailAndPassword() async {
    try {
      emit(RegisterWithEmailAndPasswordLoading());
      final user = await _authRepo.registerWithEmailAndPassword(
          RegisterWithEmailAndPasswordRequestBody(
              email: emailController.text,
              username: usernameController.text,
              password: passwordController.text));
      emit(RegisterWithEmailAndPasswordSuccess(user!));
    } on AppFirebaseAuthException catch (e) {
      AppLogger.error("Firebase Auth Exception", e.message);
      emit(RegisterWithEmailAndPasswordFailure(
          AppFirebaseAuthException(e.code).message));
    } on AppPlatformException catch (e) {
      AppLogger.error("Platform Exception", e.message);
      emit(RegisterWithEmailAndPasswordFailure(
          AppPlatformException(e.code).message));
    } on AppFirebaseException catch (e) {
      AppLogger.error("Firebase Exception", e.message);
      emit(RegisterWithEmailAndPasswordFailure(
          AppFirebaseException(e.code).message));
    } on AppExceptions catch (e) {
      AppLogger.error("General Exception", e.message);
      emit(RegisterWithEmailAndPasswordFailure(
          AppExceptions(e.message).message));
    } catch (e, stackTrace) {
      AppLogger.error("An error occurred", e);
      AppLogger.error(stackTrace.toString());
      emit(RegisterWithEmailAndPasswordFailure(e.toString()));
    }
  }
}
