import 'package:flutter/material.dart';
import '../widgets/dashboard/currentOrders.dart';
import '../widgets/dashboard/graph.dart';
import '../widgets/dashboard/collectedPayment.dart';
import '../widgets/dashboard/orderHistory.dart';
import '../widgets/dashboard/performance.dart';
import '../widgets/dashboard/receivedPayment.dart';
import 'package:provider/provider.dart';
import '../widgets/dashboard/uploadDocument.dart';
import '../model/profile/profileProvider.dart';
import '../model/ordersHistory/orderHistory.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  Map<String, dynamic> _allOrders = {};
  Map<String, dynamic> _currentOrders = {};
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderHistoryProvider>(context, listen: false)
        .getOrderHistory('all')
        .then((_) {
      setState(() {
        _allOrders = Provider.of<OrderHistoryProvider>(context, listen: false)
            .orderHistory;
      });
      Provider.of<OrderHistoryProvider>(context, listen: false)
          .getOrderHistory('order-placed')
          .then((_) {
        setState(() {
          _currentOrders =
              Provider.of<OrderHistoryProvider>(context, listen: false)
                  .orderHistory;
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final profileProvider = Provider.of<ProfileProvider>(context).profile;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        // leading: Container(
        //     width: width * 0.1,
        //     margin: EdgeInsets.only(left: width * 0.01),
        //     //height: height * 0.02,
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(10),
        //         boxShadow: const [
        //           BoxShadow(
        //               color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
        //         ]),
        //     child: Center(
        //         child: Padding(
        //       padding: EdgeInsets.only(left: width * 0.02),
        //       child: const Icon(Icons.arrow_back_ios, color: Colors.green),
        //     ))),
        title: const Text('My Dashboard',
            // textScaleFactor: textScaleFactor,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
              height: height * 1,
              width: width * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 392.png'),
                      fit: BoxFit.cover)),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.32,
                          height: height * 0.15,
                          padding: EdgeInsets.only(
                              top: height * 0.002,
                              right: width * 0.005,
                              bottom: height * 0.002),
                          decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.green,
                                    blurRadius: 2,
                                    offset: Offset(0, 2))
                              ],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Container(
                            width: width * 0.3,
                            height: 0.15,
                            padding: EdgeInsets.only(
                                left: width * 0.06,
                                top: height * 0.001,
                                bottom: height * 0.001),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(236, 236, 248, 1),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                'http://34.100.212.22${profileProvider['data']['profile_pic']}',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: height * 0.15,
                          // color: Colors.red,
                          padding: EdgeInsets.only(
                              left: width * 0.04, top: height * 0.01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                // onTap: () => Navigator.of(context)
                                //     .pushNamed('/edit-details'),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${profileProvider['data']['first_name']} ${profileProvider['data']['last_name']}',
                                        // textScaleFactor: textScaleFactor,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Icon(Icons.edit, color: Colors.black)
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                profileProvider['data']['email'],
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(color: Colors.grey[700]),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //         child: Padding(
                  //       padding:
                  //           EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  //       child: Container(
                  //         height: height * 0.06,
                  //         padding: EdgeInsets.only(left: width * 0.02),
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(20),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                   color: Colors.green,
                  //                   blurRadius: 10,
                  //                   offset: Offset(0, 2))
                  //             ]),
                  //         child: Row(
                  //           children: [
                  //             Icon(Icons.location_pin, color: Colors.green, size: 30),
                  //             Text(
                  //               '48, Tarun Sengupta Sarani',
                  //               // textScaleFactor: textScaleFactor,
                  //               style: TextStyle(color: Colors.black, fontSize: 15),
                  //             ),
                  //             SizedBox(width: width * 0.15),
                  //             Text(
                  //               'Change',
                  //               // textScaleFactor: textScaleFactor,
                  //               style: const TextStyle(
                  //                   color: Colors.black, fontWeight: FontWeight.bold),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ))
                  //   ],
                  // ),
                  SizedBox(height: height * 0.04),
                  // Padding(
                  //   padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  //   child: Graph(),
                  // ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * 0.4,
                          // width: double.infinity,
                          // width: width * 0.6,
                          // padding: EdgeInsets.symmetric(
                          //     vertical: height * 0.02, horizontal: width * 0.02),
                          padding: EdgeInsets.only(
                              left: width * 0.02,
                              top: height * 0.02,
                              right: width * 0.02,
                              bottom: height * 0.02),
                          // color: Colors.red,
                          child: OrderHistory(_allOrders),
                        ),
                      ),
                      // Container(
                      //   height: height * 0.32,
                      //   width: width * 0.4,
                      //   // color: Colors.pink,
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: height * 0.02, horizontal: width * 0.02),
                      //   child: Performance(),
                      // )
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  //Needed Later On
                  // Container(
                  //   width: double.infinity,
                  //   height: height * 0.35,
                  //   padding: EdgeInsets.only(
                  //       left: width * 0.02,
                  //       top: height * 0.01,
                  //       right: width * 0.02,
                  //       bottom: height * 0.01),
                  //   // color: Colors.red,
                  //   child: CurrentOrders(),
                  // ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: height * 0.28,
                          // color: Colors.red,
                          padding: EdgeInsets.only(
                              left: width * 0.02,
                              top: height * 0.01,
                              right: width * 0.02,
                              bottom: height * 0.01),
                          child: ReceivedPayment(),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: height * 0.28,
                          // color: Colors.blue,
                          padding: EdgeInsets.only(
                              left: width * 0.02,
                              top: height * 0.01,
                              right: width * 0.02,
                              bottom: height * 0.01),
                          child: CollectedPayment(),
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: height * 0.02),
                  // Container(
                  //   width: width * 1,
                  //   height: height * 0.33,
                  //   // color: Colors.red,
                  //   padding: EdgeInsets.only(
                  //       left: width * 0.02,
                  //       top: height * 0.01,
                  //       right: width * 0.02,
                  //       bottom: height * 0.01),
                  //   child: UploadDocument(),
                  // ),
                  SizedBox(height: height * 0.05)
                ],
              ),
            ),
    );
  }
}
