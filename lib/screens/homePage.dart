import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height);
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

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
                  child: Text(
                    'Get Set Go',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 25 : 35),
                  ),
                ),
                Container(
                  width: width * 0.7,
                  height: !tabLayout && !largeLayout
                      ? height * 0.07
                      : height * 0.055,
                  margin:
                      EdgeInsets.only(top: height * 0.02, left: width * 0.02),
                  padding: EdgeInsets.only(left: width * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.greenAccent,
                            // spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 2))
                      ]),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: !tabLayout && !largeLayout ? 25 : 30,
                      ),
                      SizedBox(width: width * 0.04),
                      Text(
                        'Locate',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontSize: !tabLayout && !largeLayout ? 20 : 25),
                      )
                    ],
                  ),
                )
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
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.25,
            top: height * 0.25,
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
            left: width * 0.56,
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
                          Navigator.of(context).pushNamed('/order-details'),
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
                    'Order\n Details',
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
            left: width * 0.2,
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
                          Navigator.of(context).pushNamed('/profile-screen'),
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
                        child: Image.asset('assets/images/rating.png',
                            scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    'Rating',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
