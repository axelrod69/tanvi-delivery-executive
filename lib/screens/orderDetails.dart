import 'package:flutter/material.dart';
import '../widgets/orderDetails/orderedProducts.dart';
import '../widgets/orderDetails/address.dart';
import 'package:provider/provider.dart';
import '../model/ordersHistory/orderHistory.dart';
import '../model/orderStatus/orderStatus.dart';

class OrderDetails extends StatefulWidget {
  final String id;
  OrderDetailsState createState() => OrderDetailsState();

  OrderDetails(this.id);
}

class OrderDetailsState extends State<OrderDetails> {
  bool isLoading = true;
  List<String> status = [
    'On The Way',
    'Delivered',
  ];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderHistoryProvider>(context, listen: false)
        .getItemDetails(widget.id)
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  String get itemCount {
    var itemLength =
        Provider.of<OrderHistoryProvider>(context, listen: false).orderDetails;
    int count = 0;
    for (final itemCount in itemLength['data']['vendorList']) {
      count += itemCount['total_items'] as int;
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider =
        Provider.of<OrderHistoryProvider>(context, listen: false).orderDetails;

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
              child: const Icon(Icons.arrow_back_ios, color: Colors.green),
            ),
          ),
        ),
        title: Text(
          'Order Details',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: !tabLayout && !largeLayout ? 16 : 25),
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
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.07,
                      margin: EdgeInsets.only(top: height * 0.02),
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              top: BorderSide(color: Colors.green, width: 2),
                              bottom:
                                  BorderSide(color: Colors.green, width: 2))),
                      child: Center(
                        child: Text(
                          'Order No: ${provider['data']['orderDetails']['order_number']}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: !tabLayout && !largeLayout ? 15 : 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Your Order',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: !tabLayout && !largeLayout ? 16 : 22),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      '$itemCount product(s) to be Delivered',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: !tabLayout && !largeLayout ? 16 : 22),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  OrderedProducts(provider['data']['vendorList']),
                  SizedBox(height: height * 0.02),
                  Address(provider['data']['orderDetails']['address'],
                      provider['data']['vendorList']),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.04, right: width * 0.04),
                    child: Container(
                      width: double.infinity,
                      // height: height * 0.05,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: !tabLayout && !largeLayout ? 20 : 25),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: height * 0.02),
                                child: Text(
                                  '₹',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize:
                                          !tabLayout && !largeLayout ? 20 : 25),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    provider['data']['orderDetails']
                                        ['grand_total'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: !tabLayout && !largeLayout
                                            ? 20
                                            : 25),
                                  ),
                                  Text(
                                    '(${provider['payment_status']})',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: !tabLayout && !largeLayout
                                            ? 11
                                            : 14),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Container(
                    width: double.infinity,
                    // color: Colors.red,
                    padding: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.02),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Change Status',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () => onTheWay(
                                    provider['data']['orderDetails']['id'],
                                    'On The Way'),
                                child: Container(
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 8,
                                            offset: Offset(1, 2))
                                      ]),
                                  child: const Center(
                                    child: Text('On The Way',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () => delivered(
                                    provider['data']['orderDetails']['id'],
                                    'On The Way'),
                                child: Container(
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 8,
                                            offset: Offset(1, 2))
                                      ]),
                                  child: const Center(
                                    child: Text('Delivered',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text('Change Status'),
                  //     DropdownButtonHideUnderline(
                  //       child:
                  //           DropdownButton(items: items, onChanged: onChanged),
                  //     )
                  //   ],
                  // )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Center(
                  //       child: Container(
                  //         width: !tabLayout && !largeLayout
                  //             ? width * 0.3
                  //             : width * 0.4,
                  //         height: !tabLayout && !largeLayout
                  //             ? height * 0.07
                  //             : height * 0.05,
                  //         decoration: BoxDecoration(
                  //             color: Colors.green,
                  //             borderRadius: BorderRadius.circular(30),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                   color: Colors.grey,
                  //                   blurRadius: 5,
                  //                   offset: Offset(1, 2))
                  //             ]),
                  //         child: Center(
                  //           child: Text(
                  //             'LOCATE SHOP',
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize:
                  //                     !tabLayout && !largeLayout ? 11 : 14),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Center(
                  //       child: Container(
                  //         width: !tabLayout && !largeLayout
                  //             ? width * 0.3
                  //             : width * 0.4,
                  //         height: !tabLayout && !largeLayout
                  //             ? height * 0.07
                  //             : height * 0.05,
                  //         decoration: BoxDecoration(
                  //             color: Colors.green,
                  //             borderRadius: BorderRadius.circular(30),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                   color: Colors.grey,
                  //                   blurRadius: 5,
                  //                   offset: Offset(1, 2))
                  //             ]),
                  //         child: Center(
                  //           child: Text(
                  //             'LOCATE CUSTOMER',
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize:
                  //                     !tabLayout && !largeLayout ? 10 : 14),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: height * 0.05),
                ],
              ),
            ),
    );
  }

  void onTheWay(int id, String s) async {
    var response = await Provider.of<OrderStatus>(context, listen: false)
        .postUpdate(id.toString(), s);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: const Text('Status Updated to On The Way',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
  }

  void delivered(int id, String s) async {
    var response = await Provider.of<OrderStatus>(context, listen: false)
        .postUpdate(id.toString(), s);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: const Text('Status Updated to Delivered',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
  }
}
