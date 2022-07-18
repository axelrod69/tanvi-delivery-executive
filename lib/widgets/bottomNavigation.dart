import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/dashboard.dart';
import '../screens/homePage.dart';
import '../screens/profile.dart';
import '../screens/notifications.dart';
import 'package:provider/provider.dart';
import '../model/profile/profileProvider.dart';
import '../screens/presentOrders.dart';
import '../model/ordersHistory/orderHistory.dart';
import '../screens/deliveredOrders.dart';
import '../model/notificationList/notificationList.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int index = 0;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProfileProvider>(context, listen: false).getProfile().then((_) {
      Provider.of<NotificationList>(context, listen: false)
          .getNotificationList()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   Timer.periodic(const Duration(seconds: 300), (Timer t) => apiCall());
  //   super.didChangeDependencies();
  // }

  // apiCall() async {
  //   double latitude = Provider.of<LocationProvider>(context, listen: false)
  //       .coorDinates['lat'];
  //   double longitude = Provider.of<LocationProvider>(context, listen: false)
  //       .coorDinates['lng'];
  //   print('Latitude LAt: $latitude');
  //   print('Longitude Long: $longitude');
  //   Provider.of<ChangeLocationProvider>(context, listen: false)
  //       .postLocation(latitude, longitude, 'active');
  // }

  final screens = [
    HomePage(),
    // Dashboard(),
    Notifications(),
    Profile(),
    PresentOrders(),
    DeliveredOrders()
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final profileProvider = Provider.of<ProfileProvider>(context).profile;

    // TODO: implement build
    return Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : screens[index],
        extendBody: true,
        bottomNavigationBar: isLoading
            ? const Text('....')
            : Container(
                height: height * 0.06,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: height * 0.02),
                // color: Colors.red,
                // padding: EdgeInsets.only(
                //   left: width * 0.15, top: height * 0.08,
                //   //  right: width * 0.04
                // ),
                // padding: EdgeInsets.only(top: height * 0.035),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: width * 0.75,
                        height: height * 0.05,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: double.infinity,
                              width: width * 0.35,
                              padding: EdgeInsets.only(left: width * 0.02),
                              // color: Colors.red,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    // onTap: () =>
                                    //     Navigator.of(context).pushNamed('/cart-screen'),
                                    onTap: () {
                                      // Navigator.of(context).pushNamed('/cart-screen');
                                      // print('Cart Screen');
                                      setState(() {
                                        index = 3;
                                      });
                                    },
                                    // onTap: () {
                                    //   screens[selectedItem] = 0 as StatefulWidget;
                                    // setState(() {

                                    // });

                                    child: Image.asset(
                                        'assets/images/Icon awesome-shopping-cart.png'),
                                  ),
                                  SizedBox(width: width * 0.1),
                                  InkWell(
                                    // onTap: () => Navigator.of(context)
                                    //     .pushNamed('/dashboard-screen'),
                                    onTap: () {
                                      // Navigator.of(context)
                                      //     .pushNamed('/dashboard-screen');
                                      // print('Dashboard Screen');
                                      setState(() {
                                        index = 1;
                                      });
                                    },
                                    // onTap: () {
                                    //   screens[selectedItem] = 1 as StatefulWidget;
                                    //   // setState(() {

                                    //   // });
                                    // },
                                    child: Image.asset(
                                        'assets/images/Icon awesome-bell.png'),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: width * 0.35,
                              // padding: EdgeInsets.only(right: width * 0.02),
                              // color: Colors.blue,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.06),
                                    child: InkWell(
                                      // onTap: () => Navigator.of(context)
                                      //     .pushNamed('/notification-screen'),
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .pushNamed('/notification-screen');
                                        // print('Notification Screen');
                                        setState(() {
                                          index = 4;
                                        });
                                      },
                                      // onTap: () {
                                      //   screens[selectedItem] = 3 as StatefulWidget;
                                      //   // setState(() {

                                      //   // });
                                      // },
                                      // child: Image.asset(
                                      //     'assets/images/Icon awesome-bell.png'),
                                      child: Icon(Icons.delivery_dining_rounded,
                                          size: 35),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.1),
                                  InkWell(
                                      // onTap: () {
                                      //   screens[selectedItem] = 4 as StatefulWidget;
                                      //   // setState(() {

                                      //   // });
                                      // },
                                      // onTap: () => Navigator.of(context)
                                      //     .pushNamed('/profile-screen'),
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .pushNamed('/profile-screen');
                                        // print('Profile Screen');
                                        setState(() {
                                          index = 2;
                                        });
                                      },
                                      child: profileProvider['data']
                                                  ['profile_pic'] ==
                                              null
                                          ? const CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.amber,
                                            )
                                          : CircleAvatar(
                                              radius: 15,
                                              backgroundImage: NetworkImage(
                                                  'http://34.100.212.22${profileProvider['data']['profile_pic']}'),
                                              // child: ClipRRect(
                                              //     borderRadius: BorderRadius.circular(20),
                                              //     child: Image.network(
                                              //       'http://34.100.212.22${profileProvider['data']['profile_pic']}',
                                              //       fit: BoxFit.contain,
                                              //     )),
                                            ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).pushNamed('/home-screen');
            setState(() {
              index = 0;
            });
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              // height: height * 0.075,
              // width: width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ],
                  border: Border.all(
                      color: Colors.green, width: 2, style: BorderStyle.solid)),
              child: Center(
                // child: Image.asset('assets/images/Icon ionic-ios-home.png')
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
