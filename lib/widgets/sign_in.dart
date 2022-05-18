import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidget extends StatefulWidget {
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusFirst.dispose();
    _focusSecond.dispose();
    _focusThird.dispose();
    _focusFourth.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: Container(
              padding:
                  EdgeInsets.only(left: width * 0.02, top: height * 0.0045),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 10,
                        // color: Color.fromRGBO(227, 189, 255, 0.5),
                        offset: Offset(1, 2))
                  ]),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                    // suffixIcon: Icon(Icons.send, color: Colors.green),
                    // label: Text(
                    //   'Enter Your Phone Number',
                    //   textScaleFactor: textScaleFactor,
                    //   style: const TextStyle(color: Colors.grey),
                    // ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_focusFirst),
              ),
            ),
          ),
          SizedBox(height: height * 0.025),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: Container(
              padding:
                  EdgeInsets.only(left: width * 0.02, top: height * 0.0045),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 10,
                        // color: Color.fromRGBO(227, 189, 255, 0.5),
                        offset: Offset(1, 2))
                  ]),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Password',
                    // suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                    // label: Text(
                    //   'Enter Your Phone Number',
                    //   textScaleFactor: textScaleFactor,
                    //   style: const TextStyle(color: Colors.grey),
                    // ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_focusFirst),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: width * 0.12),
          //   child: Text(
          //     'OTP',
          //     textScaleFactor: textScaleFactor,
          //     style: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //         fontSize: 18),
          //   ),
          // ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
