import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/changeLocation/changeLocationProvider.dart';
import '../model/location/locationProvider.dart';
import '../model/profile/profileProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tanvi/widgets/bottomNavigation.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  String? status;
  Timer? timer;

  Future<void> getStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    status = localStorage.getString('loginStatus');
  }

  @override
  void initState() {
    // TODO: implement initState

    getStatus();

    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (status == 'active') {
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
            .postLocation(latitude, longitude, 'active');
        // t.cancel();
      } else {
        double latitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lat'];
        // double latitude = number.nextDouble();
        double longitude = Provider.of<LocationProvider>(context, listen: false)
            .coorDinates['lng'];
        Provider.of<ChangeLocationProvider>(context, listen: false)
            .postLocation(latitude, longitude, 'inactive');
        t.cancel();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<ProfileProvider>(context).profile;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height:
                  !tabLayout && !largeLayout ? height * 0.12 : height * 0.07,
              // color: Colors.red,
              margin: EdgeInsets.only(top: height * 0.03),
              padding: EdgeInsets.only(left: width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () => Navigator.of(context).pop(),
                  //   child: Container(
                  //     height: !tabLayout && !largeLayout
                  //         ? height * 0.08
                  //         : height * 0.05,
                  //     width: !tabLayout && !largeLayout
                  //         ? width * 0.15
                  //         : width * 0.1,
                  //     padding: EdgeInsets.only(left: width * 0.025),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10),
                  //         boxShadow: const [
                  //           BoxShadow(
                  //               color: Colors.grey,
                  //               blurRadius: 5,
                  //               offset: Offset(0, 2))
                  //         ]),
                  //     child:
                  //         const Icon(Icons.arrow_back_ios, color: Colors.green),
                  //   ),
                  // ),
                  const Text(
                    'Profile',
                    // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: !tabLayout && !largeLayout ? height * 0.67 : height * 0.5,
              // color: Colors.red,
              margin: EdgeInsets.only(top: height * 0.05),
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  right: width * 0.04,
                  bottom: height * 0.02),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: height * 0.35,
                        padding: EdgeInsets.only(top: height * 0.08),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: Column(
                          children: [
                            Text(
                              '${provider['data']['first_name']} ${provider['data']['last_name']}',
                              // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      !tabLayout && !largeLayout ? 25 : 35),
                            ),
                            Text(
                              '${provider['data']['email']}',
                              // textScaleFactor: textScaleFactor,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                // color: Colors.blue,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          'Total Star',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: const [
                                              Icon(Icons.star,
                                                  color: Colors.yellow),
                                              Text('5',
                                                  style: TextStyle(
                                                      color: Colors.yellow,
                                                      fontSize: 20))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.05),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          'Total Rides',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          child: Row(
                                            children: const [
                                              Icon(Icons.bike_scooter,
                                                  color: Colors.green),
                                              Text('456',
                                                  style: TextStyle(
                                                      color: Colors.yellow,
                                                      fontSize: 20))
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Positioned(
                  //   top: !tabLayout && !largeLayout
                  //       ? height * 0.005
                  //       : height * 0.04,
                  //   left: 0,
                  //   right: 0,
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         decoration: const BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             boxShadow: [
                  //               BoxShadow(
                  //                   color: Colors.grey,
                  //                   blurRadius: 5,
                  //                   offset: Offset(0, 2))
                  //             ]),
                  //         child: provider['data']['profile_pic'] == null
                  //             ? const CircleAvatar(
                  //                 radius: 60,
                  //                 backgroundColor: Colors.amber,
                  //               )
                  //             : CircleAvatar(
                  //                 radius: 60,
                  //                 backgroundColor: Colors.white,
                  //                 backgroundImage: NetworkImage(
                  //                     'http://34.100.212.22${provider['data']['profile_pic']}'),
                  //                 // child: Image.asset(
                  //                 //   'assets/images/z0mztjh7.png',
                  //                 //   fit: BoxFit.cover,
                  //                 // ),
                  //               ),
                  //       ),
                  //       SizedBox(height: height * 0.005),
                  //       // Text(
                  //       //   'Edit',
                  //       //   textScaleFactor: textScaleFactor,
                  //       //   style: TextStyle(
                  //       //       color: Colors.grey[600],
                  //       //       fontWeight: FontWeight.bold),
                  //       // )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: width * 0.04),
            //       child: Text(
            //         'Address',
            //         textScaleFactor: textScaleFactor,
            //         style: const TextStyle(
            //             color: Colors.black, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     SizedBox(width: width * 0.2),
            //     Expanded(
            //       child: Text(
            //         '48, Tarun Sengupta Sarani, Dum Dum, Kolkata: 700079, West Bengal, India',
            //         textScaleFactor: textScaleFactor,
            //         style: TextStyle(color: Colors.grey[700]),
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(height: height * 0.02),
            // Row(
            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: width * 0.04),
            //       child: Text(
            //         'Password',
            //         textScaleFactor: textScaleFactor,
            //         style: const TextStyle(
            //             color: Colors.black, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     SizedBox(width: width * 0.17),
            //     Text(
            //       '*********',
            //       textScaleFactor: textScaleFactor,
            //       style: TextStyle(color: Colors.grey[700]),
            //     )
            //   ],
            // ),
            // SizedBox(height: height * 0.04),
            // Row(
            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: width * 0.04),
            //       child: Text(
            //         'Payment Method',
            //         textScaleFactor: textScaleFactor,
            //         style: const TextStyle(
            //             color: Colors.black, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     SizedBox(width: width * 0.044),
            //     Text(
            //       'Cash On Delivery',
            //       textScaleFactor: textScaleFactor,
            //       style: TextStyle(color: Colors.grey[700]),
            //     )
            //   ],
            // )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomBottomNavigation(),
    );
  }
}
