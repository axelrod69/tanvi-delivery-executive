import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreAddress extends StatefulWidget {
  final List<dynamic> productList;
  StoreAddressState createState() => StoreAddressState();

  StoreAddress(this.productList);
}

class StoreAddressState extends State<StoreAddress> {
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
              child: const Icon(Icons.arrow_back_ios, color: Colors.green),
            ),
          ),
        ),
        title: Text(
          'Store Address',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: !tabLayout && !largeLayout ? 16 : 25),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView.builder(
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 10, right: 30, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: height * 0.45,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(1, 2))
                      ]),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 4,
                        fit: FlexFit.loose,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  for (var item in widget.productList[index]
                                      ['vendor_products'])
                                    Text(
                                        '${item['product']['name']} x${widget.productList[index]['total_quantity']}'),
                                ],
                              ),
                            ),
                            itemCount: widget
                                .productList[index]['vendor_products'].length,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          child: ListView.builder(
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  // for (var item in widget.productList[index]
                                  //     ['vendor_address'])
                                  Text(
                                      'Vendor Name: ${widget.productList[index]['vendor_address']['name']}'),
                                  // for (var item in widget.productList[index]
                                  //     ['vendor_address'])
                                  Expanded(
                                      child: Text(
                                          'Address: ${widget.productList[index]['vendor_address']['address']}, ${widget.productList[index]['vendor_address']['locality']}, ${widget.productList[index]['vendor_address']['city']}, ${widget.productList[index]['vendor_address']['state']}, ${widget.productList[index]['vendor_address']['postcode']}'))
                                ],
                              ),
                            ),
                            itemCount: widget.productList.length,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          itemCount: widget.productList.length,
        ),
      ),
    );
  }
}
