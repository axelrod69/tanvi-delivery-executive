import 'package:flutter/material.dart';

class PendingOrders extends StatefulWidget {
  PendingOrdersState createState() => PendingOrdersState();
}

class PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: double.infinity,
        height: height * 0.1,
        padding: EdgeInsets.fromLTRB(
            width * 0.01, height * 0.005, width * 0.02, height * 0.005),
        margin: EdgeInsets.only(bottom: height * 0.04),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
            ]),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.green[100],
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset('assets/images/coffee.png'),
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nestle Coffee',
                    // textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      Text(
                        'Beverage',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Icon(Icons.star,
                          color: Colors.black, size: height * 0.02),
                      SizedBox(width: width * 0.02),
                      Text(
                        'Cash',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: width * 0.2),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  '₹ 60',
                  // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  '(paid)',
                  // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                // const Text(
                //   'Cancelled',
                //   // textScaleFactor: textScaleFactor,
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 15),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
