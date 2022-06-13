import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/network/authentication.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FormWidget extends StatefulWidget {
  FormWidgetState createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  String? email;
  String? password;
  String? fcm;

  Future<void> fcmCodeGenerate() async {
    fcm = await FirebaseMessaging.instance.getToken();
    print('FCM Code $fcm');
  }

  @override
  void initState() {
    // TODO: implement initState
    fcmCodeGenerate();
    super.initState();
  }

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
                // keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                    suffixIcon: Icon(Icons.send, color: Colors.green),
                    // label: Text(
                    //   'Enter Your Phone Number',
                    //   textScaleFactor: textScaleFactor,
                    //   style: const TextStyle(color: Colors.grey),
                    // ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
                validator: (execEmail) {
                  if (execEmail!.isEmpty) {
                    return 'Please Enter Email';
                  } else {
                    email = execEmail;
                    return null;
                  }
                },
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
                // keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Password',
                    suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                    // label: Text(
                    //   'Enter Your Phone Number',
                    //   textScaleFactor: textScaleFactor,
                    //   style: const TextStyle(color: Colors.grey),
                    // ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
                validator: (execPassword) {
                  if (execPassword!.isEmpty) {
                    return 'Please Enter Password';
                  } else {
                    password = execPassword;
                    return null;
                  }
                },
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
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            child: InkWell(
              onTap: () {
                if (_globalKey.currentState!.validate()) {
                  print('Clicked');
                  signIn(context, email!, password!);
                }
              },
              child: Container(
                width: double.infinity,
                height: height * 0.07,
                margin: EdgeInsets.only(top: height * 0.02),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(57, 226, 14, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    'Login',
                    // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signIn(BuildContext context, String email, String password) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {'email': email, 'password': password};

    var response = await Provider.of<Network>(context, listen: false)
        .logIn(data, 'api/delivery-executive/login/');

    var res = json.decode(response.body);

    await localStorage.setString('token', res['data']['access']);
    await localStorage.setString('refresh', res['data']['refresh']);
    final url = Uri.parse('http://54.80.135.220/' + 'api/fcm-token/');

    // var responseFcm =
    //     await Provider.of<Network>(context, listen: false).fcmToken(fcm);

    var responseFcm =
        await http.post(url, body: json.encode({'fcm_token': fcm}), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    print(responseFcm.body);

    Navigator.of(context).pushNamed('/home-screen');
  }
}
