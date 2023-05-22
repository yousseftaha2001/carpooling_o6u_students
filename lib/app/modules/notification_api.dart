import 'package:carpooling_o6u_students/app/modules/signup/signup_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationApi {
  static final noti = FlutterLocalNotificationsPlugin();
  static Future<dynamic> myBackgroundMessageHandler(NotificationResponse message)async {
   

   // Or do other work.
  //  print(message);
  print("hello");
  Get.to(()=>SignupPage());
  }

  Future<void> initNotication() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    await noti.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: (details) {
      //   // print("object");
      // },
      onDidReceiveNotificationResponse: myBackgroundMessageHandler,

      // onDidReceiveBackgroundNotificationResponse: (details) {
      //   print(details.payload);
      // },
    );
  }

  Future<void> showNotification({required String body}) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "channelId",
      "channelName",
      priority: Priority.max,
      importance: Importance.max,
      channelShowBadge: true,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
        await noti.show(0, "title", "$body", notificationDetails);
  }
}
