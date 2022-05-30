import 'package:flutter/material.dart';
import '../model/map.dart';

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
        height: height * 0.99,
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
                          padding: EdgeInsets.only(left: width * 0.04),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                  child: Text('Products To Be Picked',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              for (var itemIndex in widget.productList[index]
                                  ['vendor_products'])
                                Text(
                                    '${itemIndex['product']['name']} x${itemIndex['quantity']}')
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.loose,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: width * 0.04),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                  child: Text('Vendor Details',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                              Text(
                                  'Name: ${widget.productList[index]['vendor_address']['name']}'),
                              Text(
                                  'Address: ${widget.productList[index]['vendor_address']['address']}, ${widget.productList[index]['vendor_address']['locality']}, ${widget.productList[index]['vendor_address']['city']}, ${widget.productList[index]['vendor_address']['state']}, ${widget.productList[index]['vendor_address']['postcode']},')
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () => ExternalGoogleMap.openMap(
                                double.parse(widget.productList[index]
                                    ['vendor_address']['map_lat']),
                                double.parse(widget.productList[index]
                                    ['vendor_address']['map_lng'])),
                            child: Container(
                              height: double.infinity,
                              // width: width * 0.4,
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
                                child: Text(
                                  'Get Directions',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
