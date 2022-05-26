import 'package:flutter/material.dart';
import '../model/ordersHistory/orderHistory.dart';
import 'package:provider/provider.dart';

class PresentOrders extends StatefulWidget {
  PresentOrdersState createState() => PresentOrdersState();
}

class PresentOrdersState extends State<PresentOrders> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderHistoryProvider>(context, listen: false)
        .getOrderHistory('order-placed')
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<OrderHistoryProvider>(context).orderHistory;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.01),
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: width * 0.1,
              height: height * 0.05,
              padding: EdgeInsets.only(left: width * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Icon(Icons.arrow_back_ios, color: Colors.green),
            ),
          ),
        ),
        title: Text(
          'Present Orders',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: !tabLayout && !largeLayout ? 20 : 25),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 392.png'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: height * 0.05),
                  // height: height * 0.7,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Recent Items',
                      //       // textScaleFactor: textScaleFactor,
                      //       style: const TextStyle(
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 18),
                      //     ),
                      //     Text(
                      //       'View All',
                      //       textScaleFactor: textScaleFactor,
                      //       style: const TextStyle(
                      //           color: Colors.green, fontWeight: FontWeight.bold),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(height: height * 0.04),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Container(
                            width: double.infinity,
                            // height: !tabLayout && !largeLayout
                            //     ? height * 0.15
                            //     : height * 0.1,
                            padding: EdgeInsets.fromLTRB(width * 0.01,
                                height * 0.005, width * 0.02, height * 0.005),
                            margin: EdgeInsets.only(bottom: height * 0.04),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Container(
                                    //   height: double.infinity,
                                    //   width: !tabLayout && !largeLayout
                                    //       ? width * 0.24
                                    //       : width * 0.2,
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.green[100],
                                    //       border: Border.all(color: Colors.green),
                                    //       borderRadius: BorderRadius.circular(15)),
                                    //   child: Image.asset(_recentItems[index]['image']),
                                    // ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: width * 0.04),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order Number',
                                            // textScaleFactor: textScaleFactor,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    !tabLayout && !largeLayout
                                                        ? 14
                                                        : 15),
                                          ),
                                          Text(
                                            provider['data'][index]
                                                ['order_number'],
                                            // textScaleFactor: textScaleFactor,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    !tabLayout && !largeLayout
                                                        ? 14
                                                        : 18),
                                          ),
                                          SizedBox(height: height * 0.01),
                                          Text(
                                            provider['data'][index]
                                                ['created_at'],
                                            // textScaleFactor: textScaleFactor,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    !tabLayout && !largeLayout
                                                        ? 8
                                                        : 10),
                                          )
                                        ],
                                      ),
                                    ),
                                    // SizedBox(width: width * 0.15),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '₹${provider['data'][index]['grand_total']}',
                                          // textScaleFactor: textScaleFactor,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  !tabLayout && !largeLayout
                                                      ? 16
                                                      : 20),
                                        ),
                                        Text(
                                          '(${provider['data'][index]['payment_status']})',
                                          // textScaleFactor: textScaleFactor,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  !tabLayout && !largeLayout
                                                      ? 10
                                                      : 12),
                                        ),
                                        Text(
                                          '(${provider['data'][index]['payment_method']})',
                                          // textScaleFactor: textScaleFactor,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  !tabLayout && !largeLayout
                                                      ? 10
                                                      : 12),
                                        ),
                                        Text(
                                          provider['data'][index]
                                                      ['shipping_charge'] ==
                                                  "0.00"
                                              ? 'Free Delivery'
                                              : '(${provider['data'][index]['shipping_charge']})',
                                          // textScaleFactor: textScaleFactor,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  !tabLayout && !largeLayout
                                                      ? 10
                                                      : 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: height * 0.02),
                                const Center(
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: provider['data'].length,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
