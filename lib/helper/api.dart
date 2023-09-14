// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import '../constants/custom_toast.dart';
import '../constants/error.dart';

enum CodeStatus { defaultCode, activation }

class ApiBaseHelper {
  final String _baseUrl = "https://tharawat-reef.moltaqadev.com/api";

  ///TO DO Add BASE_URL
  final Dio dio = Dio();
  void dioInit() {
    dio.options.baseUrl = _baseUrl;
    dio.options.headers = headers;
    dio.options.sendTimeout = const Duration(milliseconds: 80000); // time in ms
    dio.options.connectTimeout =
        const Duration(milliseconds: 80000); // time in ms
    dio.options.receiveTimeout = const Duration(milliseconds: 80000);
    // ignore: avoid_single_cascade_in_expression_statements
    dio
      ..interceptors.add(
        AwesomeDioInterceptor(
          logRequestTimeout: false,
          logRequestHeaders: true,
          logResponseHeaders: false,
        ),
      );
  }

  void updateLocalInHeaders(String local) {
    headers["lang"] = local;
    dio.options.headers = headers;
  }

  ApiBaseHelper();
  Map<String, String> headers = {
    "Content-Type": 'application/json',
    "Accept": 'application/json',
  };

  Future<dynamic> get({required String url, String? token}) async {
    try {
      if (token != null && token != "") {
        headers["Authorization"] = "Bearer $token";
        dio.options.headers = headers;
      } else if (token == null || token == "") {
        dio.options.headers.remove('Authorization');
        headers.remove('Authorization');
      }
      //log(url);
      //log(headers.toString());
      final Response response = await dio.get(url);
      final responseJson = _returnResponse(response);
      //log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr("error_no_internet"));
    } on DioError catch (e) {
      log(e.error.toString());

      log(e.response?.toString() ?? "no response");
      String message =
          e.response?.data["message"] ?? tr("error_please_try_again");
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.message!.contains('SocketException')) {
        message = tr("error_no_internet");
      }
      throw ServerException(message: message);
    }
  }

  Future<dynamic> getFromPayment({required String url, String? token}) async {
    try {
      dio.options.baseUrl = ""; //TODO
      final Response response = await dio.get(url);
      final responseJson = _returnResponse(response);
      // log(responseJson.toString());
      dio.options.baseUrl = _baseUrl;
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr("error_no_internet"));
    } on DioError catch (e) {
      log(e.toString());
      log(e.response?.toString() ?? "no response");
      String message =
          e.response?.data["message"] ?? tr("error_please_try_again");
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.message!.contains('SocketException')) {
        message = tr("error_no_internet");
      }
      throw ServerException(message: message);
    }
  }

  Future<dynamic> put({
    required String url,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      // headers["Content-language"] = local;
      final Response response;
      if (token != null && token != "") {
        headers["Authorization"] = "Bearer $token";
        dio.options.headers = headers;
        // // log(url + token);
      } else if (token == null || token == "") {
        dio.options.headers.remove('Authorization');
        headers.remove('Authorization');
      }
      //log(body.toString());
      if (body != null) {
        // FormData formData = FormData.fromMap(body);
        response = await dio.put(url, data: body);
      } else {
        response = await dio.put(url);
      }
      final responseJson = _returnResponse(response);
      //log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr("error_no_internet"));
    } on DioError catch (e) {
      log(e.toString());
      log(e.response?.toString() ?? "no response");
      String message =
          e.response?.data["message"] ?? tr("error_please_try_again");
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.message!.contains('SocketException')) {
        message = tr("error_no_internet");
      }
      throw ServerException(message: message);
    }
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    try {
      if (token != null && token != "") {
        headers["Authorization"] = "Bearer $token";

        dio.options.headers = headers;
        // log(url + token);
      } else if (token == null || token == "") {
        dio.options.headers.remove('Authorization');
        headers.remove('Authorization');
      }

      dio.options.headers = headers;

      //log(body.toString());
      // log(dio.options.headers.toString());
      FormData formData = FormData.fromMap(body);

      //log(url);
      final Response response = await dio.post(url, data: formData);
      final responseJson = _returnResponse(response);
      // log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr("error_no_internet"));
    } on DioError catch (e) {
      log("DioError ----->$e");
      log("DioError ----->${e.response?.data}");
      customToast(content: e.response?.data, isError: true);
      String message =
          e.response?.data ?? e.response?.data ?? tr("error_please_try_again");
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.message!.contains('SocketException')) {
        message = tr("error_no_internet");
      }
      throw ServerException(message: message, respnose: e.response);
    }
  }

  Future<dynamic> postWithImage(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    try {
      dio.options.sendTimeout =
          const Duration(milliseconds: 30000); // time in ms
      dio.options.connectTimeout =
          const Duration(milliseconds: 30000); // time in ms
      dio.options.receiveTimeout = const Duration(milliseconds: 30000);
      if (token != null && token != "") {
        headers["Authorization"] = "Bearer $token";
        dio.options.headers = headers;
        // log(url + token);
      } else if (token == null || token == "") {
        dio.options.headers.remove('Authorization');
        headers.remove('Authorization');
      }
      // log(body.toString());
      // log(dio.options.headers.toString());
      FormData formData = FormData.fromMap(body);

      //log(url);
      final Response response = await dio.post(url, data: formData);
      final responseJson = _returnResponse(response);
      // log(responseJson.toString());
      dio.options.sendTimeout =
          const Duration(milliseconds: 8000); // time in ms
      dio.options.connectTimeout =
          const Duration(milliseconds: 8000); // time in ms
      dio.options.receiveTimeout = const Duration(milliseconds: 8000);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr("error_no_internet"));
    } on DioError catch (e) {
      log(e.toString());
      log(e.toString());
      String message =
          e.response?.data["message"] ?? tr("error_please_try_again");
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.message!.contains('SocketException')) {
        message = tr("error_no_internet");
      }
      throw ServerException(message: message);
    }
  }

  removeToken() {
    dio.options.headers.remove('Authorization');
    headers.remove('Authorization');
  }

  Future<dynamic> delete({
    required String url,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      // headers["Content-language"] = local;
      if (token != null && token != "") {
        headers["Authorization"] = "Bearer $token";
        dio.options.headers = headers;
      }
      final Response response;
      //log(body.toString());
      //  log(dio.options.headers.toString());
      // FormData formData = FormData.fromMap(body);
      if (body != null) {
        response = await dio.delete(url, queryParameters: body);
      } else {
        response = await dio.delete(
          url,
        );
      }

      log(url);
      final responseJson = _returnResponse(response);
      // log(responseJson.toString());
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr("error_no_internet"));
    } on DioError catch (e) {
      log(e.toString());
      String message =
          e.response?.data["message"] ?? tr("error_please_try_again");
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.message!.contains('SocketException')) {
        message = tr("error_no_internet");
      }
      throw ServerException(message: message);
    }
  }

  Future uploadImage({required String url, required File file}) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final Response response = await dio.post(url, data: formData);
      final responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr("error_no_internet"));
    } on DioError catch (e) {
      log(e.toString());
      String message =
          e.response?.data["message"] ?? tr("error_please_try_again");
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.message!.contains('SocketException')) {
        message = tr("error_no_internet");
      }
      throw ServerException(message: message);
    }
  }
  //

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 422:
        throw response.data.toString();
      case 403:
        throw UnauthorizedException(message: response.data);
      case 500:
      default:
        debugPrint(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode} ${response.data}');
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode} ${response.data}');
    }
  }
}

class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([message]) : super(message, "Unauthorized: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
