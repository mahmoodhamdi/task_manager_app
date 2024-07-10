import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:task_manager_app/features/authentication/data/repos/auth_repo.dart';
import 'package:task_manager_app/features/authentication/presentation/manager/cubits/login_with_email_and_password/login_with_email_and_password_cubit.dart';
 import 'package:task_manager_app/features/authentication/presentation/manager/cubits/registerwithemailandpassword/register_with_email_and_password_cubit.dart';
import 'package:task_manager_app/features/home/presentation/manager/logic/navigation/navigation_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register DataBase Helper
  
  // Register FirebaseAuth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

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
}
