import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager_app/core/databases/database_helper.dart';
import 'package:task_manager_app/features/authentication/data/repos/auth_repo.dart';
import 'package:task_manager_app/features/authentication/logic/cubits/login_with_email_and_password/login_with_email_and_password_cubit.dart';
import 'package:task_manager_app/features/authentication/logic/cubits/registerwithemailandpassword/register_with_email_and_password_cubit.dart';
import 'package:task_manager_app/features/authentication/logic/cubits/user/user_cubit.dart';
import 'package:task_manager_app/features/home/logic/cubits/navigation_cubit/navigation_cubit_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register FirebaseAuth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  // Register DatabaseHelper
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // Register GoogleSignIn
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  // Register AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt<FirebaseAuth>(), getIt<GoogleSignIn>()),
  );

// Register RegisterWithEmailAndPasswordCubit
  getIt.registerFactory<RegisterWithEmailAndPasswordCubit>(
      () => RegisterWithEmailAndPasswordCubit());
// Register LoginWithEmailAndPasswordCubit
  getIt.registerFactory<LoginWithEmailAndPasswordCubit>(
      () => LoginWithEmailAndPasswordCubit());
// Register NavigationCubit
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());
  // Register UserCubit
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt<AuthRepo>()));
}
