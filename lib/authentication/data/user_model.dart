import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
    final String token;
    final User user;
    UserModel({
        required this.token,
        required this.user,
    });
    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
    );
}

class User {
    final int id;
    final String name;
    final String phone;
    final dynamic address;
    final int areaId;
    final dynamic email;
    final int cashback;
    final dynamic code;
    final int countCodeUsed;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String fcmToken;
    final int status;
    final int governorateId;
    final Area area;
    final Area governorate;

    User({
        required this.id,
        required this.name,
        required this.phone,
        required this.address,
        required this.areaId,
        required this.email,
        required this.cashback,
        required this.code,
        required this.countCodeUsed,
        required this.createdAt,
        required this.updatedAt,
        required this.fcmToken,
        required this.status,
        required this.governorateId,
        required this.area,
        required this.governorate,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        areaId: json["area_id"],
        email: json["email"],
        cashback: json["cashback"],
        code: json["code"],
        countCodeUsed: json["count_code_used"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fcmToken: json["fcm_token"],
        status: json["status"],
        governorateId: json["governorate_id"],
        area: Area.fromJson(json["area"]),
        governorate: Area.fromJson(json["governorate"]),
    );
}

class Area {
    final int id;
    final String name;
    Area({
        required this.id,
        required this.name,
    });
    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
    );
}
