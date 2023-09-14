part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginErrorState extends AuthState {
  final String message;
  const LoginErrorState({required this.message});
}

final class LoginSuccessState extends AuthState {} 

final class RegisterLoadingState extends AuthState {}

final class RegisterErrorState extends AuthState {
  final String message;
  const RegisterErrorState({required this.message});
}

final class RegisterSuccessState extends AuthState {}
