import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/errors/exceptions.dart';
import 'package:task_manager_app/core/errors/firebase_auth_exceptions.dart';
import 'package:task_manager_app/core/errors/firebase_exceptions.dart';
import 'package:task_manager_app/core/errors/platform_exceptions.dart';
import 'package:task_manager_app/core/utils/logger.dart';
import 'package:task_manager_app/features/authentication/data/repos/auth_repo.dart';
import 'package:task_manager_app/features/authentication/presentation/manager/cubits/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._authRepo) : super(UserInitial());
  final AuthRepo _authRepo;

  Future<void> getUser() async {
    emit(UserLoading());
    try {
      final user = await _authRepo.getCurrentUser();
      if (user != null) {
        emit(UserLoaded(user));
      }
    } on AppFirebaseAuthException catch (e) {
      AppLogger.error("Firebase Auth Exception", e.message);
      emit(UserFailure(AppFirebaseAuthException(e.code).message));
    } on AppPlatformException catch (e) {
      AppLogger.error("Platform Exception", e.message);
      emit(UserFailure(AppPlatformException(e.code).message));
    } on AppFirebaseException catch (e) {
      AppLogger.error("Firebase Exception", e.message);
      emit(UserFailure(AppFirebaseException(e.code).message));
    } on AppExceptions catch (e) {
      AppLogger.error("General Exception", e.message);
      emit(UserFailure(AppExceptions(e.message).message));
    } catch (e, stackTrace) {
      AppLogger.error("An error occurred", e);
      AppLogger.error(stackTrace.toString());
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> logOut() async {
    try {
      await _authRepo.logOut();
      emit(UserInitial());
    } catch (e) {
      rethrow;
    }
  }
}
