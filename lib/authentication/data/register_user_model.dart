// To parse this JSON data, do
//
//     final registerUserModel = registerUserModelFromJson(jsonString);

import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

class RegisterUserModel {
    final String token;
    final User user;
    RegisterUserModel({
        required this.token,
        required this.user,
    });
    factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
    );
}

class User {
    final String name;
    final String phone;
    final String fcmToken;
    final int code;
    final int status;
    final String areaId;
    final String governorateId;
    final DateTime updatedAt;
    final DateTime createdAt;
    final int id;
    User({
        required this.name,
        required this.phone,
        required this.fcmToken,
        required this.code,
        required this.status,
        required this.areaId,
        required this.governorateId,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        phone: json["phone"],
        fcmToken: json["fcm_token"],
        code: json["code"]??0,
        status: json["status"],
        areaId: json["area_id"],
        governorateId: json["governorate_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );
}
