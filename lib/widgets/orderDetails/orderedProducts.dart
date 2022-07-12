import 'package:flutter/material.dart';

class OrderedProducts extends StatefulWidget {
  final List<dynamic> productList;
  OrderedProductsState createState() => OrderedProductsState();

  OrderedProducts(this.productList);
}

class OrderedProductsState extends State<OrderedProducts> {
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
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int index = 0; index < widget.productList.length; index++)
              for (var itemIndex in widget.productList[index]
                  ['vendor_products'])
                Column(
                  children: [
                    Container(
                        height: !tabLayout && !largeLayout
                            ? height * 0.145
                            : height * 0.125,
                        width: width * 0.3,
                        // margin: EdgeInsets.only(right: width * 0.02),
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.01),
                        margin: EdgeInsets.only(right: width * 0.02),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            // 'http://34.100.212.22${widget.productList[itemIndex]['vendor_products'][0]['main_image']}'
                            'http://34.100.212.22${itemIndex['product']['main_image']}',
                            // _categoryItems[index]['image']
                            fit: BoxFit.contain,
                          ),
                        )),
                    Expanded(
                      child: Text(
                        '${itemIndex['product']['name']} x${itemIndex['quantity']}',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: !tabLayout && !largeLayout ? 14 : 16),
                      ),
                    ),
                  ],
                )
          ],
        ),
        // color: Colors.red,
        // child: ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context, index) => Container(
        //     width: width * 0.28,
        //     // height: height * 0.1,
        //     padding: EdgeInsets.only(
        //       // left: width * 0.02,
        //       top: height * 0.01,
        //       // right: height * 0.02
        //     ),
        //     color: Colors.amber,
        //     margin: EdgeInsets.only(right: width * 0.02),
        //     child: Column(
        //       children: [
        //         for (var itemIndex in widget.productList[index]
        //             ['vendor_products'])
        //           Container(
        //               height: !tabLayout && !largeLayout
        //                   ? height * 0.145
        //                   : height * 0.125,
        //               width: width * 0.6,
        //               // margin: EdgeInsets.only(right: width * 0.02),
        //               padding: EdgeInsets.symmetric(
        //                   vertical: height * 0.01, horizontal: width * 0.01),
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(10),
        //                   border: Border.all(color: Colors.green, width: 2),
        //                   boxShadow: const [
        //                     BoxShadow(
        //                         color: Colors.grey,
        //                         blurRadius: 5,
        //                         offset: Offset(0, 2))
        //                   ]),
        //               child: Image.network(
        //                   'http://34.100.212.22${itemIndex['product']['main_image']}'
        //                   // _categoryItems[index]['image']
        //                   )),
        //         SizedBox(height: height * 0.01),
        //         // for (var itemIndexTwo in widget.productList[index]
        //         //     ['vendor_products'])
        //         for (var itemIndex in widget.productList[index]
        //             ['vendor_products'])
        // Expanded(
        //   child: Text(
        //     '${itemIndex['product']['name']} x${itemIndex['quantity']}',
        //     // textScaleFactor: textScaleFactor,
        //     style: TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold,
        //         fontSize: !tabLayout && !largeLayout ? 14 : 16),
        //   ),
        // ),
        //       ],
        //     ),
        //   ),
        //   itemCount: widget.productList.length,
        // ),
      ),
    );
  }
}
