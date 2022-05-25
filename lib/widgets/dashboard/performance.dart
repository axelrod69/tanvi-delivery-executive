import 'package:flutter/material.dart';

class Performance extends StatefulWidget {
  PerformanceState createState() => PerformanceState();
}

class PerformanceState extends State<Performance> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: width * 1,
      height: height * 1,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.02, top: height * 0.01, right: width * 0.02),
            child: Text(
              'Performance',
              textScaleFactor: textScaleFactor,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: const Text(
                  'Order Completed',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  // value: 50,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: const Text(
                  'Order Failed',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  // value: 50,
                  color: Colors.red,
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: const Text(
                  'Total Orders',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                  // value: 50,
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
