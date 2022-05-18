import 'package:flutter/material.dart';

class PresentOrderDetails extends StatefulWidget {
  PresentOrderDetailsState createState() => PresentOrderDetailsState();
}

class PresentOrderDetailsState extends State<PresentOrderDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width * 0.04, top: height * 0.005, right: width * 0.04),
          child: Container(
            width: double.infinity,
            height: height * 0.1,
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            offset: Offset(1, 2))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/images/coffee.png',
                      scale: !tabLayout && !largeLayout ? 1.2 : 1.0),
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
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: !tabLayout && !largeLayout ? 14 : 18),
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
                                fontSize: !tabLayout && !largeLayout ? 11 : 14),
                          ),
                          SizedBox(width: width * 0.02),
                          Icon(Icons.star,
                              color: Colors.black,
                              size: !tabLayout && !largeLayout
                                  ? height * 0.015
                                  : height * 0.02),
                          SizedBox(width: width * 0.02),
                          Text(
                            'Cash',
                            // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: !tabLayout && !largeLayout ? 11 : 14),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: width * 0.15),
                Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '₹ 60',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: !tabLayout && !largeLayout ? 16 : 20),
                      ),
                      Text(
                        '(unpaid)',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: !tabLayout && !largeLayout ? 12 : 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
        Expanded(
          child: Container(
            width: double.infinity,
            // color: Colors.red,
            margin: EdgeInsets.only(bottom: height * 0.035),
            padding: EdgeInsets.only(
                left: width * 0.03, top: height * 0.02, bottom: height * 0.02),
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.green),
                    bottom: BorderSide(color: Colors.green))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      !tabLayout && !largeLayout ? 12 : 16),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              '48, Tarun Sengupta Sarani, Dum Dum, Kolkata-700079',
                              style: TextStyle(
                                  fontSize:
                                      !tabLayout && !largeLayout ? 10 : 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        // color: Colors.amber,
                        child: Center(
                          child: Text(
                            'In Process',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: !tabLayout && !largeLayout ? 12 : 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shop Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      !tabLayout && !largeLayout ? 12 : 16),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              '125/1 Ripon Street, Kolkata-700012',
                              style: TextStyle(
                                  fontSize:
                                      !tabLayout && !largeLayout ? 10 : 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        // color: Colors.amber,
                        child: Center(
                          child: Text(
                            'In Process',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: !tabLayout && !largeLayout ? 12 : 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
