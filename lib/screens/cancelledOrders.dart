import 'package:flutter/material.dart';

class CancelledOrders extends StatefulWidget {
  CancelledOrdersState createState() => CancelledOrdersState();
}

class CancelledOrdersState extends State<CancelledOrders> {
  final List<dynamic> _recentItems = [
    {
      'id': 1,
      'image': 'assets/images/coffee.png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
    {
      'id': 2,
      'image': 'assets/images/coffee.png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
    {
      'id': 3,
      'image': 'assets/images/coffee.png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
    {
      'id': 4,
      'image': 'assets/images/coffee.png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

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
          'Cancelled Orders',
          // textScaleFactor: textScaleFactor,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: !tabLayout && !largeLayout ? 16 : 14),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: height * 0.05),
            // height: height * 0.7,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.02),
                    child: Container(
                      width: double.infinity,
                      height: !tabLayout && !largeLayout
                          ? height * 0.15
                          : height * 0.1,
                      padding: EdgeInsets.fromLTRB(width * 0.01, height * 0.005,
                          width * 0.02, height * 0.005),
                      margin: EdgeInsets.only(bottom: height * 0.04),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2))
                          ]),
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: !tabLayout && !largeLayout
                                ? width * 0.22
                                : width * 0.2,
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(_recentItems[index]['image']),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: width * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _recentItems[index]['name'],
                                  // textScaleFactor: textScaleFactor,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          !tabLayout && !largeLayout ? 14 : 18),
                                ),
                                SizedBox(height: height * 0.01),
                                // Row(
                                //   children: [
                                //     Text(
                                //       _recentItems[index]['category'],
                                //       // textScaleFactor: textScaleFactor,
                                //       style: TextStyle(
                                //         color: Colors.grey[600],
                                //         fontWeight: FontWeight.bold,

                                //       ),
                                //     ),
                                //     SizedBox(width: width * 0.02),
                                //     Icon(Icons.star,
                                //         color: Colors.black,
                                //         size: height * 0.02),
                                //     SizedBox(width: width * 0.02),
                                //     Text(
                                //       'Cash',
                                //       // textScaleFactor: textScaleFactor,
                                //       style: TextStyle(
                                //         color: Colors.grey[600],
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //     )
                                //   ],
                                // )
                              ],
                            ),
                          ),
                          SizedBox(width: width * 0.12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                _recentItems[index]['price'],
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        !tabLayout && !largeLayout ? 16 : 20),
                              ),
                              Text(
                                '(unpaid)',
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        !tabLayout && !largeLayout ? 10 : 12),
                              ),
                              Text(
                                'Cancelled',
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        !tabLayout && !largeLayout ? 12 : 15),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: _recentItems.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
