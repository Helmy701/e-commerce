import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../helper/api.dart';

class ServerException implements Exception {
  final String message;
  final CodeStatus code;
  final Response? respnose;
  ServerException({
    this.respnose,
    required this.message,
    this.code = CodeStatus.defaultCode,
  });
}

class CacheException implements Exception {}

class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException({required this.message});
}

class NoCacheOrderException implements Exception {}

class CacheUserAcssesToken implements Exception {}

class ResetPasswordException implements Exception {}

class OrderTypeException implements Exception {}

class StatusException implements Exception {
  final String message;
  StatusException({required this.message});
}

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  final String message;
  final CodeStatus code;
  ServerFailure({
    required this.message,
    this.code = CodeStatus.defaultCode,
  });
}

class CacheFailure extends Failure {}

class AuthFailure extends Failure {
  final String message;
  AuthFailure({required this.message});
}

class NoCachedUserFailure extends Failure {}

class ResetPasswordFailure extends Failure {}

class StatusFailure extends Failure {
  final String message;
  StatusFailure({required this.message});
}

class FirebaseFailure extends Failure {
  final String message;
  FirebaseFailure({required this.message});
}
