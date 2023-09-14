import 'package:e_commerce/authentication/presentation/screens/Forget_Password.dart';
import 'package:e_commerce/authentication/presentation/screens/Signup_Done.dart';
import 'package:e_commerce/authentication/presentation/screens/Start.dart';
import 'package:e_commerce/authentication/presentation/screens/Validation_Code.dart';
import 'package:e_commerce/layout/Home_Layout.dart';
import 'package:e_commerce/screens/Login_Screen.dart';
import 'package:flutter/material.dart';

import '../authentication/logic/cubit/auth_cubit.dart';
import '../authentication/presentation/screens/Signup_Screen.dart';
import '../constants/constant.dart';
import '../injection_container.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return sl<AuthCubit>().appRepository.loadAppData() == null ||
                sl<AuthCubit>().appRepository.loadAppData()!.token!.isEmpty
            ? MaterialPageRoute(builder: (context) => const Start())
            : MaterialPageRoute(builder: (context) => const HomeLayout());
      case "/login":
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case "/signUp":
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      case "/successSignUp":
        return MaterialPageRoute(builder: (context) => const SignUpIsDone());
      case "/forgetPassword":
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      case "/validationCode":
        return MaterialPageRoute(builder: (context) => ValidationCode());
      case "/home":
        return MaterialPageRoute(builder: (context) => const HomeLayout());
    }
    return null;
  }
}
