import 'package:flutter/material.dart';

class CurrentOrders extends StatefulWidget {
  CurrentOrdersState createState() => CurrentOrdersState();
}

class CurrentOrdersState extends State<CurrentOrders> {
  final List<dynamic> _CurrentOrdersItems = [
    {
      'id': 1,
      'image': 'assets/images/5a38c13bd49760.4796956515136689238708.png',
      'name': 'Coffee'
    },
    {'id': 2, 'image': 'assets/images/pngegg(1).png', 'name': 'Spinach'},
    {'id': 3, 'image': 'assets/images/pngegg(2).png', 'name': 'Onion'},
    {'id': 4, 'image': 'assets/images/pngegg(5).png', 'name': 'Kiwi'},
    {'id': 5, 'image': 'assets/images/pngegg.png', 'name': 'Apple'},
    {
      'id': 6,
      'image': 'assets/images/vegetables-15395.png',
      'name': 'Vegetables'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(
          left: width * 0.02, top: height * 0.01, right: width * 0.02),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Orders Details',
            textScaleFactor: textScaleFactor,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: height * 0.01),
          Expanded(
            child: Container(
              // color: Colors.red,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      // color: Colors.amber,
                      padding: EdgeInsets.only(
                          left: width * 0.01, right: width * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.1,
                            // color: Colors.pink,
                            padding: EdgeInsets.only(
                                left: width * 0.01, right: width * 0.01),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                              offset: Offset(1, 2))
                                        ]),
                                    child: Image.asset(
                                        'assets/images/vegetables-15395.png'),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    // color: Colors.red,
                                    padding:
                                        EdgeInsets.only(left: width * 0.01),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'No.of Item- ${10}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              'Processing',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            // Radio(
                                            //   value: value,
                                            //   groupValue: groupValue,
                                            //   onChanged: onChanged)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Text('Shop Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: height * 0.01),
                          const Expanded(
                            child: Text(
                                '48, Tarun Sengupta Sarani, Dum Dum, PO.Italgacha, Kolkata-700079, West Bengal, India',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.01),
                    child: Container(
                        height: double.infinity,
                        width: width * 0.005,
                        color: Colors.grey),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      // color: Colors.amber,
                      padding: EdgeInsets.only(
                          left: width * 0.01, right: width * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.1,
                            // color: Colors.pink,
                            padding: EdgeInsets.only(
                                left: width * 0.01, right: width * 0.01),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                              offset: Offset(1, 2))
                                        ]),
                                    child: Image.asset(
                                        'assets/images/vegetables-15395.png'),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    // color: Colors.red,
                                    padding: EdgeInsets.only(
                                        left: width * 0.01,
                                        right: width * 0.01),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'No.of Item- ${10}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              'Processing',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            // Radio(
                                            //   value: value,
                                            //   groupValue: groupValue,
                                            //   onChanged: onChanged)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Text('Shop Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: height * 0.01),
                          const Expanded(
                            child: Text(
                                '48, Tarun Sengupta Sarani, Dum Dum, PO.Italgacha, Kolkata-700079, West Bengal, India',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
