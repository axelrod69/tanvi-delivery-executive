import 'package:flutter/material.dart';
import 'package:tanvi_delivery/widgets/register.dart';
import './screens/signIn.dart';
import './screens/register.dart';
import './screens/homePage.dart';
import './widgets/bottomNavigation.dart';
import './screens/cancelledOrders.dart';
import './screens/orderDetails.dart';
import './screens/presentOrders.dart';
import './screens/orderHistory.dart';
import './screens/profile.dart';

void main() => runApp(TanviDeliveryApp());

class TanviDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
      // home: CustomBottomNavigation(),
      home: RegisterForm(),
      routes: {
        '/cancelled-orders': ((context) => CancelledOrders()),
        '/order-details': (context) => OrderDetails(),
        '/present-orders': (context) => PresentOrders(),
        '/order-history': (context) => OrderHistory(),
        '/profile-screen': (context) => Profile()
      },
    );
  }
}
