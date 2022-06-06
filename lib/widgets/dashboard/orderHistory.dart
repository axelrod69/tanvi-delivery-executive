import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/ordersHistory/orderHistory.dart';

class OrderHistory extends StatefulWidget {
  final Map<String, dynamic> orderHistory;
  OrderHistoryState createState() => OrderHistoryState();

  OrderHistory(this.orderHistory);
}

class OrderHistoryState extends State<OrderHistory> {
  final List<dynamic> _orderHistory = [
    {
      'id': 1,
      'name': 'The Super Store',
      'quantity': 10,
      'image': 'assets/images/kindpng_1606870.png',
      'status': 'Delivered'
    },
    {
      'id': 2,
      'name': 'The Super Store',
      'quantity': 10,
      'image': 'assets/images/kindpng_1606870.png',
      'status': 'On The Way'
    },
    {
      'id': 3,
      'name': 'The Super Store',
      'quantity': 10,
      'image': 'assets/images/kindpng_1606870.png',
      'status': 'Cancelled'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: width * 1,
      height: height * 1,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                child: Text(
                  'Order History',
                  textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              // Padding(
              //   padding:
              //       EdgeInsets.only(right: width * 0.02, top: height * 0.01),
              //   child: Text(
              //     'View All',
              //     textScaleFactor: textScaleFactor,
              //     style: const TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 12),
              //   ),
              // )
            ],
          ),
          // SizedBox(height: height * 0.02),
          Expanded(
              child: widget.orderHistory['data'].length == 0
                  ? const Text('No Orders Delivered')
                  : Container(
                      width: double.infinity,
                      // color: Colors.amber,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: height * 0.1,
                          //Padding to be removed later
                          padding: EdgeInsets.only(left: width * 0.05),
                          margin: EdgeInsets.only(bottom: height * 0.005),
                          // color: Colors.blue,
                          child: Row(
                            children: [
                              //Image
                              // Flexible(
                              //   flex: 1,
                              //   child: Container(
                              //     height: double.infinity,
                              //     // color: Colors.pink,
                              //     padding: EdgeInsets.symmetric(
                              //         vertical: height * 0.01, horizontal: width * 0.01),
                              //     child: Container(
                              //         width: double.infinity,
                              //         height: double.infinity,
                              //         padding: EdgeInsets.symmetric(
                              //             vertical: height * 0.01,
                              //             horizontal: width * 0.01),
                              //         decoration: BoxDecoration(
                              //             color: Colors.white,
                              //             border:
                              //                 Border.all(color: Colors.green, width: 2),
                              //             borderRadius: BorderRadius.circular(20),
                              //             boxShadow: const [
                              //               BoxShadow(
                              //                   color: Colors.grey,
                              //                   blurRadius: 5,
                              //                   offset: Offset(0, 2))
                              //             ]),
                              //         child: ClipRRect(
                              //           borderRadius: BorderRadius.circular(20),
                              //           child: Image.network(
                              //             widget.orderHistory['data'][index][],
                              //             fit: BoxFit.contain,
                              //           ),
                              //         )),
                              //   ),
                              // ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  height: double.infinity,
                                  // color: Colors.purple,
                                  padding: EdgeInsets.only(top: height * 0.01),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.orderHistory['data'][index]
                                            ['order_number'],
                                        textScaleFactor: textScaleFactor,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      //To be added back on later if needed
                                      // Text(
                                      //   'No. of Item = ${_orderHistory[index]['quantity'].toString()}',
                                      //   textScaleFactor: textScaleFactor,
                                      //   style: const TextStyle(
                                      //       color: Colors.black,
                                      //       fontWeight: FontWeight.bold,
                                      //       fontSize: 12),
                                      // ),
                                      Text(
                                        'Amount To Be Paid = ${widget.orderHistory['data'][index]['grand_total']}',
                                        textScaleFactor: textScaleFactor,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        widget.orderHistory['data'][index]
                                            ['order_status'],
                                        textScaleFactor: textScaleFactor,
                                        style: const TextStyle(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                        // style: TextStyle(
                                        //     color: _orderHistory[index]
                                        //                 ['status'] ==
                                        //             'Delivered'
                                        //         ? Colors.green
                                        //         : _orderHistory[index]
                                        //                     ['status'] ==
                                        //                 'On The Way'
                                        //             ? Colors.amber
                                        //             : Colors.red,
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        itemCount: widget.orderHistory['data'].length < 3
                            ? widget.orderHistory['data'].length
                            : 3,
                      ),
                    ))
        ],
      ),
    );
  }
}
