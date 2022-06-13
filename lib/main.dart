import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import './screens/signIn.dart';
import 'notificationService/localNotificationService.dart';
import 'screens/editDetails.dart';
import './screens/homePage.dart';
import './widgets/bottomNavigation.dart';
import './screens/cancelledOrders.dart';
import './screens/orderDetails.dart';
import './screens/presentOrders.dart';
import './screens/orderHistory.dart';
import './screens/profile.dart';
import './screens/notifications.dart';
import './screens/editDetails.dart';
import 'package:provider/provider.dart';
import './model/network/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/changePassword.dart';
import './model/profile/profileProvider.dart';
import './model/location/locationProvider.dart';
import './model/changeLocation/changeLocationProvider.dart';
import './model/ordersHistory/orderHistory.dart';
import './screens/deliveredOrders.dart';
import './model/orderStatus/orderStatus.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(TanviDeliveryApp());
}

class TanviDeliveryApp extends StatefulWidget {
  TanviDeliveryAppState createState() => TanviDeliveryAppState();
}

class TanviDeliveryAppState extends State<TanviDeliveryApp> {
  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    _checkIfLoggedIn();

    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // SharedPreferences refresh = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    // localStorage.remove('token');
    // localStorage.remove('refresh');
    print('Access Tokeeeeeeeeeeeeeeeen : ${localStorage.getString('token')}');
    print(
        'Refressssssssssh Tokeeeeeeeeeen : ${localStorage.getString('refresh')}');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Network()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => ChangeLocationProvider()),
        ChangeNotifierProvider(create: (context) => OrderHistoryProvider()),
        ChangeNotifierProvider(create: (context) => OrderStatus())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
        home: isAuth ? CustomBottomNavigation() : SignIn(),
        // home: SignIn(),
        // home: OrderDetails(),
        routes: {
          '/home-screen': (context) => CustomBottomNavigation(),
          '/cancelled-orders': (context) => CancelledOrders(),
          // '/order-details': (context) => OrderDetails(),
          '/present-orders': (context) => PresentOrders(),
          '/order-history': (context) => OrderHistory(),
          '/profile-screen': (context) => Profile(),
          '/notification-screen': (context) => Notifications(),
          '/edit-details': (context) => EditDetails(),
          '/change-password': (context) => Password(),
          '/delivered-orders': (context) => DeliveredOrders(),
        },
      ),
    );
  }
}
