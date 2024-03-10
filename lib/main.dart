import 'package:baxi/splash-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   debugPrint("Handling a background message: ${message.messageId}");
// }

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await FirebaseMessaging.instance.requestPermission(provisional: true);
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // debugPrint('fcmToken: $fcmToken');
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('fa'),
      home: SplashScreen(),
    );
  }
}
