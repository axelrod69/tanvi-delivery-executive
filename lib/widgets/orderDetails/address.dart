import 'package:flutter/material.dart';
import '../../screens/storeAddress.dart';

class Address extends StatefulWidget {
  final List<dynamic> productList;
  AddressState createState() => AddressState();

  Address(this.productList);
}

class AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: double.infinity,
        // height: !tabLayout && !largeLayout ? height * 0.35 : height * 0.2,
        padding: EdgeInsets.only(top: height * 0.03, bottom: height * 0.03),
        decoration: const BoxDecoration(
            // color: Colors.red,
            border: Border(
                top: BorderSide(color: Colors.grey, width: 2),
                bottom: BorderSide(color: Colors.grey, width: 2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Store Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(width: width * 0.12),
                Expanded(
                  child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              StoreAddress(widget.productList))),
                      child: Text('View All')),
                )
              ],
            ),
            SizedBox(height: height * 0.05),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Address',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(width: width * 0.072),
                const Expanded(
                  child: Text('View All'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
