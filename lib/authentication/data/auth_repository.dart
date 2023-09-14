import 'package:dartz/dartz.dart';
import 'package:e_commerce/authentication/data/register_user_model.dart';
import 'package:e_commerce/authentication/data/user_model.dart';

import '../../constants/custom_toast.dart';
import '../../constants/error.dart';
import 'auth_web_services.dart';

class AuthRepository {
  final AuthWebServices authWebServices;
  AuthRepository({
    required this.authWebServices,
  });

  Future<Either<Failure, UserModel>> login(
      {required String phone, required String password}) async {
    try {
      final respone =
          await authWebServices.login(password: password, phone: phone);
      if (respone.containsKey("Error")) {
        customToast(content: respone["Error"].toString(), isError: true);
        return Left(ServerFailure(message: respone["Error"].toString()));
      } else {
        return Right(UserModel.fromJson(respone));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, RegisterUserModel>> register({
    required String name,
    required String phone,
    required String password,
    required String governorate,
    required String area,
  }) async {
    try {
      final respone = await authWebServices.register(
          name: name,
          phone: phone,
          password: password,
          governorate: governorate,
          area: area);
      return Right(RegisterUserModel.fromJson(respone));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, String>> checkPhone({
    required String phone,
  }) async {
    try {
      final respone = await authWebServices.checkPhone(phone: phone);
      return Right(respone);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, String>> resetPassword(
      {required String phone,
      required String password,
      required String confirmPassword}) async {
    try {
      final respone = await authWebServices.resetPassword(
          phone: phone, password: password, confirmPassword: confirmPassword);
      return Right(respone);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
