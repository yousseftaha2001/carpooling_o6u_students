import 'package:carpooling_o6u_students/app/core/theme/thems.dart';
import 'package:carpooling_o6u_students/app/modules/notification_api.dart';
import 'package:carpooling_o6u_students/app/routes/start_point_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  NotificationApi().showNotification(body: message.notification!.body!);
 
}
Future<void> notificationInit() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
     

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        NotificationApi().showNotification(body: message.notification!.body!);

      }
    });
  }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  await NotificationApi().initNotication();
  await notificationInit();
  await GetStorage.init();
 

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your App Title',
          initialRoute: StartPointRoutes.startPoint,
          // home: const StartPointPage(),
          getPages: AppPages.routes,
          theme: AppTheme.lightTheme,
          defaultTransition: Transition.circularReveal,
        );
      },
    );
  }
}
