import 'package:flutter/material.dart';

class OrderedProducts extends StatefulWidget {
  final List<dynamic> productList;
  OrderedProductsState createState() => OrderedProductsState();

  OrderedProducts(this.productList);
}

class OrderedProductsState extends State<OrderedProducts> {
  final List<dynamic> _categoryItems = [
    {
      'id': 1,
      'name': 'Tomatoes',
      'discountPrice': '30.00/kg',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 1,
      'image': 'assets/images/tomato-15559.png',
      'weight': '2/KG'
    },
    {
      'id': 2,
      'name': 'Cabbage',
      'discountPrice': '30.00/KG',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 2,
      'image': 'assets/images/PngItem_1310699.png',
      'weight': '2/KG'
    },
    {
      'id': 3,
      'name': 'Onions',
      'discountPrice': '30.00/kg',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 3,
      'image': 'assets/images/tomato-15559.png',
      'weight': '2/KG'
    },
    {
      'id': 4,
      'name': 'Turnip',
      'discountPrice': '30.00/kg',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 4,
      'image': 'assets/images/PngItem_1310699.png',
      'weight': '2/KG'
    }
  ];

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
        height: !tabLayout && !largeLayout ? height * 0.24 : height * 0.18,
        // color: Colors.red,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            width: width * 0.28,
            // height: height * 0.1,
            padding: EdgeInsets.only(
              // left: width * 0.02,
              top: height * 0.01,
              // right: height * 0.02
            ),
            // color: Colors.amber,
            margin: EdgeInsets.only(right: width * 0.02),
            child: Column(
              children: [
                for (var itemIndex in widget.productList[index]
                    ['vendor_products'])
                  Container(
                      height: !tabLayout && !largeLayout
                          ? height * 0.145
                          : height * 0.125,
                      width: width * 0.6,
                      // margin: EdgeInsets.only(right: width * 0.02),
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green, width: 2),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2))
                          ]),
                      child: Image.network(
                          'http://192.168.0.114:3000${itemIndex['product']['main_image']}'
                          // _categoryItems[index]['image']
                          )),
                SizedBox(height: height * 0.01),
                // for (var itemIndexTwo in widget.productList[index]
                //     ['vendor_products'])
                for (var itemIndex in widget.productList[index]
                    ['vendor_products'])
                  Expanded(
                    child: Text(
                      '${itemIndex['product']['name']} x${widget.productList[index]['total_quantity']}',
                      // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: !tabLayout && !largeLayout ? 14 : 16),
                    ),
                  ),
              ],
            ),
          ),
          itemCount: widget.productList.length,
        ),
      ),
    );
  }
}
