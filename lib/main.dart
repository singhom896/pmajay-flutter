import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmajay/utills/CustomColor.dart';
import 'package:pmajay/view/screen/DashBoard.dart';
import 'package:pmajay/view/screen/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'firebase/firebase_options.dart';
import 'locator.dart';
import 'network/viewmodel/DropdownNotifier.dart';
import 'network/viewmodel/PmajayVM.dart';


final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set the background messaging handler early on, as a named top-level function
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // if (!kIsWeb) {
  //   await setupFlutterNotifications();
  // }

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  WidgetsFlutterBinding.ensureInitialized();
  /*NotificationService().init();*/
  getToken();
  // await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());


}
Future<void> getToken() async {
  String? _deviceToken = await _firebaseMessaging.getToken();
  print(_deviceToken);
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PmajayVM()),
          ChangeNotifierProvider(create: (_) => DropdownNotifier()),

        ],
        child: MaterialApp(
          // theme: ThemeData(
          //   primaryColor: CustomColor.white,
          //   primaryColorDark: CustomColor.white,// Define the primary color
          //   iconTheme: IconThemeData(color: Colors.white),
          // ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.white),
            useMaterial3: true,
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
              bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
            ),
          ),
          debugShowCheckedModeBanner: false,
          // initialRoute: Routes.initialRoute,
          // routes: Routes.routes,
          home: splash_screen(),
          //home: YourScreen(),
          // home: PortraitLandscapePlayerPage(),
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/DashBoard': (context) =>  DashBoard(),


          },
        )
    );


  }
}


// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await setupFlutterNotifications();
//   showFlutterNotification(message);
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   print('Handling a background message ${message.messageId}');
// }
//
// /// Create a [AndroidNotificationChannel] for heads up notifications
// late AndroidNotificationChannel channel;
//
// bool isFlutterLocalNotificationsInitialized = false;
//
// Future<void> setupFlutterNotifications() async {
//   if (isFlutterLocalNotificationsInitialized) {
//     return;
//   }
//   channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description:
//     'This channel is used for important notifications.', // description
//     importance: Importance.high,
//   );
//
//   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   /// Create an Android Notification Channel.
//   ///
//   /// We use this channel in the `AndroidManifest.xml` file to override the
//   /// default FCM channel to enable heads up notifications.
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//       AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   /// Update the iOS foreground notification presentation options to allow
//   /// heads up notifications.
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   isFlutterLocalNotificationsInitialized = true;
// }
//
// void showFlutterNotification(RemoteMessage message) {
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//   if (notification != null && android != null && !kIsWeb) {
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           // TODO add a proper drawable resource to android, for now using
//           //      one that already exists in example app.
//           icon: '@mipmap/ic_launcher',
//         ),
//       ),
//     );
//   }
// }
//
// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

