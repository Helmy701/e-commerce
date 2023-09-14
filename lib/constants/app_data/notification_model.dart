
import 'dart:convert';

PushNotificationModel pushnotificationModelFromJson(String str) =>
    PushNotificationModel.fromJson(json.decode(str));

String pushnotificationModelToJson(PushNotificationModel data) =>
    json.encode(data.toJson());

class PushNotificationModel {
  PushNotificationModel(
      {this.read,
      this.destinationId,
      this.destination,
      this.createdAt,
      this.body,
      this.title,
      this.name,
      this.profilePath});

  String? read;
  String? destinationId;
  String? destination;
  String? createdAt;
  String? body;
  String? title;
  String? name;
  String? profilePath;

  factory PushNotificationModel.fromJson(Map<String, dynamic> json) =>
      PushNotificationModel(
          read: json["read"] ?? "",
          destinationId: json["destination_id"] ?? "",
          destination: json["destination"] ?? "",
          createdAt: json["created_at"] ?? "",
          body: json["body"] ?? "",
          title: json["title"] ?? "",
          name: json["name"] ?? "",
          profilePath: json["profile_photo_path"] ?? "");

  Map<String, dynamic> toJson() => {
        "read": read,
        "destination_id": destinationId,
        "destination": destination,
        "created_at": createdAt,
        "body": body,
        "title": title,
        "name": name,
        "profile_photo_path": profilePath
      };
}
