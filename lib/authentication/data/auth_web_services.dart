// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

// import 'package:dio/dio.dart';

import '../../constants/app_data/repo.dart';
import '../../constants/notification_service.dart';
import '../../helper/api.dart';

const String loginUrl = 'login';
const String registerUrl = 'register';
const String checkPhoneUrl = 'checkPhone';
const String resetPasswordUrl = 'resetPassword';

class AuthWebServices {
  final ApiBaseHelper apiBaseHelper;
  final AppRepository appRepository;
  // final Dio dio = Dio();

  AuthWebServices({
    required this.apiBaseHelper,
    required this.appRepository,
  });

  Future<Map<String, dynamic>> login(
      {required String phone, required String password}) async {
    String? pushToken = await NotificationService.instance!.getToken();
    try {
      var response = await apiBaseHelper.post(
        url: loginUrl,
        body: {
          "phone": phone,
          "password": password,
          "fcm_token": pushToken ?? ""
        },
        //token: appRepository.loadAppData()!.token
      );
      log(response.toString());
      if (response.runtimeType == String) {
        return {"error": response};
      } else {
        return response;
      }
    } catch (e) {
      log(e.toString());

      return {"Error": e.toString()};
      // throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String password,
    required String governorate,
    required String area,
  }) async {
    String? pushToken = await NotificationService.instance!.getToken();
    try {
      var response = await apiBaseHelper.post(
        url: registerUrl,
        body: {
          "name": name,
          "phone": phone,
          "password": password,
          "fcm_token": pushToken ?? "",
          "code": "969457",
          "governorate_id": governorate,
          "area_id": area
        },
        //token: appRepository.loadAppData()!.token
      );
      log(response['user'].toString());
      return response;
    } catch (e) {
      log(e.toString());
      return {"Error": e.toString()};
      // throw Exception(e.toString());
    }
  }

  Future<String> checkPhone({required String phone}) async {
    try {
      var response = await apiBaseHelper.post(
        url: checkPhoneUrl,
        body: {
          "phone": phone,
        },
      );
      return response;
    } catch (e) {
      log(e.toString());
      return "Error: $e";
      // throw Exception(e.toString());
    }
  }

  Future<String> resetPassword(
      {required String phone,
      required String password,
      required String confirmPassword}) async {
    try {
      var response = await apiBaseHelper.post(
        url: resetPasswordUrl,
        body: {
          "phone": phone,
          "password": password,
          "confirm_password": confirmPassword,
        },
      );
      return response;
    } catch (e) {
      log(e.toString());
      return "Error: $e";
      // throw Exception(e.toString());
    }
  }
}
