import 'package:flutter/material.dart';
import '../widgets/presentOrders/presentOrderDetail.dart';
import '../widgets/presentOrders/pendingOrders.dart';

class PresentOrders extends StatefulWidget {
  PresentOrdersState createState() => PresentOrdersState();
}

class PresentOrdersState extends State<PresentOrders> {
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
          'Present Order',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: !tabLayout && !largeLayout ? 20 : 25),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Container(
                width: double.infinity,
                height:
                    !tabLayout && !largeLayout ? height * 0.6 : height * 0.65,
                margin: EdgeInsets.only(top: height * 0.05),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/Rectangle 392.png',
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green, width: 2),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 8,
                          offset: Offset(1, 2))
                    ]),
                child: PresentOrderDetails(),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.4,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              offset: Offset(1, 2))
                        ]),
                    child: Center(
                      child: Text(
                        'LOCATE SHOP',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: !tabLayout && !largeLayout ? 10 : 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              offset: Offset(1, 2))
                        ]),
                    child: Center(
                      child: Text(
                        'LOCATE CUSTOMER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: !tabLayout && !largeLayout ? 10 : 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            // PendingOrders()
          ],
        ),
      ),
    );
  }
}
