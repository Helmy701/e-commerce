import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import 'app_data/notification_model.dart';


AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  var initialzationSettingsAndroid =
      const AndroidInitializationSettings('logo');
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid, iOS: initializationSettingsIOS);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: android.smallIcon,
            priority: Priority.max,
            enableLights: true,
            playSound: true,
          ),
        ));
  }
}

GetIt locator = GetIt.instance;

class NotificationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  void setupLocator() {
    locator.registerLazySingleton(() => NotificationService());
  }

  NotificationService();

  Future<dynamic> navigateTo(Widget screenRout) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (_) => screenRout));
  }

  static final NotificationService _instance = NotificationService._internal();
  static NotificationService? get instance => _instance;
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? _localNotificationsPlugin;
  NotificationService._internal();
  static bool firstRun = true;
  // GlobalKey<NavigatorState> _navKey;
  Future<String?> getToken() {
    return _messaging.getToken();
  }

  Future<void> deleteToken() {
    return _messaging.deleteToken();
  }

  Future<void> subscripeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  Future<void> unsubscripeToTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  Future<void> initNotificationService() async {
    // _navKey = GlobalKey(debugLabel: "Main Navigator");
    await _initFirebaseMessaging();
    _initLocalNotifications();
    _checkForInitialMessage();
  }

  Future<void> _initLocalNotifications() async {
    debugPrint("init local notifications");
    _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidSettings = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var iosSettings = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    var settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    await _localNotificationsPlugin!.initialize(
      settings,

      onDidReceiveNotificationResponse: (payload) async {
        debugPrint("onDidReceiveBackgroundNotificationResponse pressed");
        var payloadMap = pushnotificationModelFromJson(payload.payload!);
        log(payloadMap.toString());
        PushNotification notification = PushNotification(
            title: payloadMap.title,
            body: payloadMap.body,
            destinationId: payloadMap.destinationId ?? "",
            destinationName: payloadMap.destination ?? "",
            read: payloadMap.read ?? "",
            name: payloadMap.name ?? "",
            profilePath: payloadMap.profilePath ?? "");
        if (notification.destinationName != "" ||
            notification.destinationId != "") {
          return routePushNotification(pushNotification: notification);
        }
      },
    );

    firstRun = false;
  }

  Future<void> _initFirebaseMessaging() async {
    debugPrint("init firebase messaging");
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        final payloadMap = jsonDecode(json.encode(message.data));
        log(payloadMap.toString());
        PushNotification notification = PushNotification(
          title: message.notification!.title,
          body: message.notification!.body,
          destinationId: message.data["destination_id"] ?? "",
          destinationName: message.data["destination"] ?? "",
          read: message.data["read"] ?? "",
          name: message.data["name"],
          // profilePath: message.data["destination"] != "Chat"
          //     ? ""
          //     : message.data["profile_photo_path"],
        );
        if (notification.destinationName != "" ||
            notification.destinationId != "") {
          return routePushNotification(pushNotification: notification);
        }
      });
      debugPrint('User granted permission');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        log(message.data.toString());

        PushNotificationModel notificationModel = PushNotificationModel(
          read: message.data["read"],
          destination: message.data["destination"],
          destinationId: message.data["destination_id"],
          body: message.notification!.body,
          title: message.notification!.title,
          name: message.data["name"] ?? "",
          profilePath: message.data["profile_photo_path"] ?? "",
        );
        String notificationtring =
            pushnotificationModelToJson(notificationModel);
        // NotificationModel.fromJson(payloadMap);
        PushNotification notification = PushNotification(
          title: message.notification!.title,
          body: message.notification!.body,
          destinationId: message.data["destination_id"] ?? "",
          destinationName: message.data["destination"] ?? "",
          read: message.data["read"] ?? "",
          createdAt: message.data["created_at"] ?? "",
          name: message.data["name"],
          // profilePath: message.data["destination"] != "Chat"
          //     ? ""
          //     : message.data["profile_photo_path"],
        );
        // if (notification != null) {
        await showLocalNotification(
            notification.title!, notification.body!, notificationtring);
        // }
      });
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  _checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification!.title,
        body: initialMessage.notification!.body,
        destinationId: initialMessage.data["destination_id"] ?? "",
        destinationName: initialMessage.data["destination"] ?? "",
        read: initialMessage.data["read"] ?? "",
        name: initialMessage.data["name"] ?? "",
        // profilePath: initialMessage.data == null
        //     ? ""
        //     : initialMessage.data["profile_photo_path"],
      );
      if (notification.destinationName != "" ||
          notification.destinationId != "") {
        return routePushNotification(pushNotification: notification);
      }
      debugPrint(notification.body.toString());
    }
  }

  // Future<Option<Failure>> deleteToken() async {
  //   final result = await _messaging.deleteInstanceID();
  //   if (!result) return some(Failure("server-error"));
  //   return none();
  // }

  Future<void> showLocalNotification(
      String title, String body, String payload) async {
    debugPrint("showing ....");
    var androidDetails = const AndroidNotificationDetails("1", "chats",
        importance: Importance.max,
        priority: Priority.max,
        showWhen: false,
        styleInformation: BigTextStyleInformation(''));
    var iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    await _localNotificationsPlugin!.show(1, title, body,
        NotificationDetails(android: androidDetails, iOS: iosDetails),
        payload: payload);
  }
}

class PushNotification {
  PushNotification(
      {this.title,
      this.body,
      this.destinationId,
      this.destinationName,
      this.name,
      this.profilePath,
      this.imagePath,
      this.createdAt,
      this.read});
  String? title;
  String? body;
  String? destinationName;
  String? destinationId;
  String? name;
  String? profilePath;
  String? read;
  String? imagePath;
  String? createdAt;
}

void routePushNotification({PushNotification? pushNotification}) {

}