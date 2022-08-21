import 'dart:async';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanvi_delivery/model/network/authentication.dart';
import 'package:tanvi_delivery/screens/signIn.dart';
import '../model/location/locationProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/changeLocation/changeLocationProvider.dart';
import '../notificationService/localNotificationService.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isLoading = true;
  bool isPressed = false;
  String? status;
  late Timer _timer;

  Future<void> getStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    status = localStorage.getString('loginStatus');
    status == 'active' ? isPressed = true : isPressed = false;
    print('Status: $status');
    print('isPresseddddddddd: $isPressed');
    status == 'active' && isPressed == true ? locationUpdate(status!) : null;
  }

  @override
  void initState() {
    // TODO: implement initState
    // statusExec();
    Provider.of<ChangeLocationProvider>(context, listen: false)
        .getLocationDetails()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });

    getStatus();

    // print('Initial Status: $isPressed');

    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  locationUpdate(String status) async {
    print('Location Update');
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (isPressed == true) {
        double latitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lat'];
        // double latitude = number.nextDouble();
        double longitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lng'];
        // double longitude = number.nextDouble();
        print('Latitude LAt: $latitude');
        print('Longitude Long: $longitude');
        print('Status Inside: $status');
        Provider.of<ChangeLocationProvider>(context, listen: false)
            .postLocation(latitude, longitude, status);
      } else {
        double latitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lat'];
        // double latitude = number.nextDouble();
        double longitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lng'];
        Provider.of<ChangeLocationProvider>(context, listen: false)
            .postLocation(latitude, longitude, status);
        t.cancel();
      }
    });
  }

  apiCall(String execStatus) async {
    print('Is Pressed: $isPressed');
    print('execStatus: $execStatus');
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (isPressed == true) {
        double latitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lat'];
        // double latitude = number.nextDouble();
        double longitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lng'];
        // double longitude = number.nextDouble();
        print('Latitude LAt: $latitude');
        print('Longitude Long: $longitude');
        print('Status Inside: $status');
        Provider.of<ChangeLocationProvider>(context, listen: false)
            .postLocation(latitude, longitude, execStatus);
        // t.cancel();
      } else {
        double latitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lat'];
        // double latitude = number.nextDouble();
        double longitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lng'];
        Provider.of<ChangeLocationProvider>(context, listen: false)
            .postLocation(latitude, longitude, execStatus);
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height);
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider =
        Provider.of<ChangeLocationProvider>(context).locationDetails;

    print('Address ${Provider.of<LocationProvider>(context).address}');

    // TODO: implement build
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/images/WhatsApp Image 2022-04-12 at 13.21.05.png'),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        fit: FlexFit.tight,
                        child: Container(
                          // color: Colors.red,
                          padding: EdgeInsets.only(right: width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Get Set Go',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        !tabLayout && !largeLayout ? 25 : 35),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                              // color: Colors.amber,
                              padding: EdgeInsets.only(right: width * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        SharedPreferences localStorage =
                                            await SharedPreferences
                                                .getInstance();
                                        var data = {
                                          'refresh':
                                              localStorage.getString('refresh')
                                        };
                                        Provider.of<Network>(context,
                                                listen: false)
                                            .logOut(data, 'api/log-out/')
                                            .then((_) {
                                          setState(() {
                                            localStorage.remove('token');
                                          });
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (_) => SignIn()));
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/sign_in', (route) => false);
                                        });
                                      },
                                      child: Icon(Icons.logout)),
                                ],
                              )))
                    ],
                  ),
                ),
                // Container(
                //   width: width * 0.7,
                //   height: !tabLayout && !largeLayout
                //       ? height * 0.07
                //       : height * 0.055,
                //   margin:
                //       EdgeInsets.only(top: height * 0.02, left: width * 0.02),
                //   padding: EdgeInsets.only(left: width * 0.02),
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(20),
                //       boxShadow: const [
                //         BoxShadow(
                //             color: Colors.greenAccent,
                //             // spreadRadius: 5,
                //             blurRadius: 5,
                //             offset: Offset(0, 2))
                //       ]),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.location_on,
                //         color: Colors.green,
                //         size: !tabLayout && !largeLayout ? 25 : 30,
                //       ),
                //       SizedBox(width: width * 0.04),
                //       Text(
                //         'Locate',
                //         // textScaleFactor: textScaleFactor,
                //         style: TextStyle(
                //             color: Colors.grey.withOpacity(0.6),
                //             fontSize: !tabLayout && !largeLayout ? 20 : 25),
                //       )
                //     ],
                //   ),
                // )
              ],
              // ),
              // Container(
              //   width: width * 0.3,
              // )
            ),
          ),
          Positioned(
            left: width * 0.25,
            top: !tabLayout && !largeLayout ? height * 0.42 : height * 0.4,
            right: width * 0.25,
            child: InkWell(
              onTap: () async {
                SharedPreferences localStorage =
                    await SharedPreferences.getInstance();
                setState(() {
                  isPressed = !isPressed;
                  status = isPressed == true ? 'active' : 'inactive';
                  localStorage.setString('loginStatus', status!);
                  print(
                      'Login Status: ${localStorage.getString('loginStatus')}');
                  print(isPressed);
                  print('Executive Status: $status');
                });
                // apiCall(status!);
                if (status == 'active') {
                  apiCall(status!);
                } else {
                  apiCall('inactive');
                }
              },
              child: Container(
                width: width * 0.05,
                height: height * 0.15,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(1, 2))
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: width * 0.02,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: status == 'active'
                          ? const Color.fromARGB(255, 36, 192, 41)
                          : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        status == 'active' ? 'Active' : 'Inactive',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.25,
            top: height * 0.24,
            right: width * 0.25,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.12, right: width * 0.12),
              child: Container(
                height:
                    !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
                width: width * 0.15,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02,
                          top: height * 0.002,
                          right: height * 0.01),
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/present-orders'),
                        child: Container(
                          width: double.infinity,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.green, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset(1, 2))
                              ]),
                          child: Image.asset('assets/images/presentOrders.png',
                              scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      'Present\n Orders',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: !tabLayout && !largeLayout ? 12 : 14),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.05,
            top: height * 0.42,
            // right: width * 0.6,
            child: Container(
              height:
                  !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
              width: width * 0.25,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.002,
                        right: height * 0.01),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/order-history'),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(1, 2))
                            ]),
                        child: Image.asset('assets/images/orderHistory.png',
                            scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    'Order\n History',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.7,
            top: height * 0.42,
            // right: width * 0.6,
            child: Container(
              height:
                  !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
              width: width * 0.25,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.002,
                        right: height * 0.01),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/cancelled-orders'),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(1, 2))
                            ]),
                        child: Image.asset('assets/images/cancelledOrders.png',
                            scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    'Cancelled\n Orders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            //To Be Reinstated
            // left: width * 0.56,
            left: width * 0.38,
            top: height * 0.58,
            // right: width * 0.6,
            child: Container(
              height:
                  !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
              width: width * 0.25,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.002,
                        right: height * 0.01),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/delivered-orders'),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.green, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(1, 2))
                            ]),
                        child: Image.asset('assets/images/orderDetails.png',
                            scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    'Delivered\n Orders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          ),
          //To Be Reinstated
          // Positioned(
          //   left: width * 0.2,
          //   top: height * 0.58,
          //   // right: width * 0.6,
          //   child: Container(
          //     height:
          //         !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
          //     width: width * 0.25,
          //     // color: Colors.amber,
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.only(
          //               left: width * 0.02,
          //               top: height * 0.002,
          //               right: height * 0.01),
          //           child: InkWell(
          //             onTap: () =>
          //                 Navigator.of(context).pushNamed('/profile-screen'),
          //             child: Container(
          //               width: double.infinity,
          //               height: height * 0.1,
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   shape: BoxShape.circle,
          //                   border: Border.all(color: Colors.green, width: 2),
          //                   boxShadow: const [
          //                     BoxShadow(
          //                         color: Colors.grey,
          //                         blurRadius: 10,
          //                         offset: Offset(1, 2))
          //                   ]),
          //               child: Image.asset('assets/images/rating.png',
          //                   scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
          //             ),
          //           ),
          //         ),
          //         SizedBox(height: height * 0.005),
          //         Text(
          //           'Rating',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: !tabLayout && !largeLayout ? 12 : 14),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }
}
