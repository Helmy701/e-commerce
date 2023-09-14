import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../injection_container.dart';
import '../logic/cubit/auth_cubit.dart';
import '../logic/cubit/check_phone_cubit.dart';
import '../logic/cubit/reset_password_cubit.dart';
import 'auth_repository.dart';
import 'auth_web_services.dart';

Future<void> initAuthInjection(GetIt sl) async {
  //* cubit
  sl.registerFactory<AuthCubit>(
      () => AuthCubit(authRepository: sl(), appRepository: sl()));
  sl.registerFactory<CheckPhoneCubit>(() => CheckPhoneCubit(
        authRepository: sl(),
      ));
  sl.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(
        authRepository: sl(),
      ));

  //* Data sources
  sl.registerLazySingleton<AuthWebServices>(
    () => AuthWebServices(
      apiBaseHelper: sl(),
      appRepository: sl(),
      // firebaseMessaging: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(authWebServices: sl()
        // firebaseMessaging: sl(),
        ),
  );
}

List<BlocProvider> appAuthBlocs(BuildContext context) => [
      BlocProvider<AuthCubit>(
          create: (BuildContext context) => sl<AuthCubit>()),
      BlocProvider<CheckPhoneCubit>(
          create: (BuildContext context) => sl<CheckPhoneCubit>()),
      BlocProvider<ResetPasswordCubit>(
          create: (BuildContext context) => sl<ResetPasswordCubit>()),
    ];
