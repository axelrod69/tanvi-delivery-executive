import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/network/authentication.dart';
import './signIn.dart';

class InputOTP extends StatefulWidget {
  InputOTPState createState() => InputOTPState();
  final String message;

  InputOTP(this.message);
}

class InputOTPState extends State<InputOTP> {
  final _focusFirst = FocusNode();
  final _focusSecond = FocusNode();
  final _focusThird = FocusNode();
  final _focusFourth = FocusNode();
  final _key = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  String? _firstPin;
  String? _secondPin;
  String? _thirdPin;
  String? _fourthPin;
  String? _password;
  String? _confirmPassword;
  int seconds = 60;
  bool isTimer = true;
  Timer? timer;
  String? fcm;
  // bool isLoading = true;

  Future<void> fcmCodeGenerate() async {
    fcm = await FirebaseMessaging.instance.getToken();
    print('FCM Codessssssssssssssssssss $fcm');
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    // TODO: implement initState
    fcmCodeGenerate();
    requestTimer();
    super.initState();
  }

  void requestTimer() async {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (seconds == 0) {
        setState(() {
          isTimer = !isTimer;
        });
        timer.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  void restart() async {
    seconds = 60;
    isTimer = !isTimer;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (seconds == 0) {
        setState(() {
          isTimer = !isTimer;
        });
        timer.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusFirst.dispose();
    _focusSecond.dispose();
    _focusThird.dispose();
    _focusFourth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // var textScale = MediaQuery.of(context).textScaleFactor;
    bool tabLayout = width > 600;
    bool largeLayout = width > 350 && width < 600;
    // final routes =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // final mobile = routes['mobile'];
    // final name = routes['name'];
    // final flag = routes['flag'];
    // final addressDetails = routes['houseDetails'];
    // final streetName = routes['streetName'];

    // print('mobile: $mobile');
    // print('name: $name');
    // print('flag: $flag');
    // print('addressDetails: $addressDetails');
    // print('streetName: $streetName');

    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Text(widget.message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color.fromRGBO(154, 154, 154, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.08)),
            ),
          ),
          SizedBox(height: height * 0.05),
          Form(
            key: _key,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tabLayout
                        ? Container(
                            width: width * 0.15,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(1, 2))
                                ]),
                            child: TextFormField(
                              showCursor: true,
                              cursorHeight: height * 0.08,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: width * 0.1),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_focusFirst),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (first) {
                                _firstPin = first;
                                return null;
                              },
                            ),
                          )
                        : largeLayout
                            ? Container(
                                width: width * 0.15,
                                height: height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: 45,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusFirst),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (first) {
                                    _firstPin = first;
                                    return null;
                                  },
                                ),
                              )
                            : Container(
                                width: width * 0.15,
                                height: height * 0.08,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: height * 0.04,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusFirst),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (first) {
                                    _firstPin = first;
                                    return null;
                                  },
                                ),
                              ),
                    SizedBox(width: width * 0.04),
                    tabLayout
                        ? Container(
                            width: width * 0.15,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(1, 2))
                                ]),
                            child: TextFormField(
                              showCursor: true,
                              cursorHeight: height * 0.08,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: width * 0.1),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_focusSecond),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (second) {
                                _secondPin = second;
                                return null;
                              },
                            ),
                          )
                        : largeLayout
                            ? Container(
                                width: width * 0.15,
                                height: height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: 45,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusSecond),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (second) {
                                    _secondPin = second;
                                    return null;
                                  },
                                ),
                              )
                            : Container(
                                width: width * 0.15,
                                height: height * 0.08,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: height * 0.04,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusSecond),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (second) {
                                    _secondPin = second;
                                    return null;
                                  },
                                ),
                              ),
                    SizedBox(width: width * 0.04),
                    tabLayout
                        ? Container(
                            width: width * 0.15,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(1, 2))
                                ]),
                            child: TextFormField(
                              showCursor: true,
                              cursorHeight: height * 0.08,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: width * 0.1),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_focusThird),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (third) {
                                _thirdPin = third;
                                return null;
                              },
                            ),
                          )
                        : largeLayout
                            ? Container(
                                width: width * 0.15,
                                height: height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: 45,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusThird),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (third) {
                                    _thirdPin = third;
                                    return null;
                                  },
                                ),
                              )
                            : Container(
                                width: width * 0.15,
                                height: height * 0.08,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: height * 0.04,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusThird),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (third) {
                                    _thirdPin = third;
                                    return null;
                                  },
                                ),
                              ),
                    SizedBox(width: width * 0.04),
                    tabLayout
                        ? Container(
                            width: width * 0.15,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(1, 2))
                                ]),
                            child: TextFormField(
                              showCursor: true,
                              cursorHeight: height * 0.08,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1)
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: width * 0.1),
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_focusFourth),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (fourth) {
                                _fourthPin = fourth;
                                return null;
                              },
                            ),
                          )
                        : largeLayout
                            ? Container(
                                width: width * 0.15,
                                height: height * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: 45,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusFourth),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (fourth) {
                                    _fourthPin = fourth;
                                    return null;
                                  },
                                ),
                              )
                            : Container(
                                width: width * 0.15,
                                height: height * 0.08,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(1, 2))
                                    ]),
                                child: TextFormField(
                                  showCursor: true,
                                  cursorHeight: height * 0.04,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context)
                                          .requestFocus(_focusFourth),
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (fourth) {
                                    _fourthPin = fourth;
                                    return null;
                                  },
                                ),
                              ),
                  ],
                ),
                SizedBox(height: height * 0.04),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.08, right: width * 0.08),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.02, top: height * 0.0045),
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
                          style: TextStyle(fontSize: tabLayout ? 25 : 18),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Enter New Password',
                              hintStyle:
                                  TextStyle(fontSize: tabLayout ? 25 : 18),
                              // suffixIcon: mobileNumber!.length < 10
                              //     ? null
                              //     : const Icon(Icons.check_circle,
                              //         color: Colors.green),
                              // label: Text(
                              //   'Enter Your Phone Number',
                              //   textScaleFactor: textScaleFactor,
                              //   style: const TextStyle(color: Colors.grey),
                              // ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          // onFieldSubmitted: (_) =>
                          //     FocusScope.of(context).requestFocus(_focusFirst),
                          validator: (passWrd) {
                            if (passWrd!.isEmpty) {
                              return 'Please Enter Password';
                            } else {
                              _password = passWrd;
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.045),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.08, right: width * 0.08),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: width * 0.02, top: height * 0.0045),
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
                          style: TextStyle(fontSize: tabLayout ? 25 : 18),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle:
                                  TextStyle(fontSize: tabLayout ? 25 : 18),
                              // suffixIcon: mobileNumber!.length < 10
                              //     ? null
                              //     : const Icon(Icons.check_circle,
                              //         color: Colors.green),
                              // label: Text(
                              //   'Enter Your Phone Number',
                              //   textScaleFactor: textScaleFactor,
                              //   style: const TextStyle(color: Colors.grey),
                              // ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          // onFieldSubmitted: (_) =>
                          //     FocusScope.of(context).requestFocus(_focusFirst),
                          validator: (passWrd) {
                            if (passWrd!.isEmpty) {
                              return 'Please Enter Password';
                            } else {
                              _confirmPassword = passWrd;
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: height * 0.045),
          InkWell(
            onTap: () {
              if (_key.currentState!.validate()) {
                // if (flag == '0') {
                //   checkOtpSignIn(mobile, context);
                // } else {
                //   checkOtpSignUp(
                //       mobile, context, name, addressDetails, streetName);
                // }
                changePassword(_password!, _confirmPassword!);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Container(
                width: double.infinity,
                height: height * 0.07,
                margin: EdgeInsets.only(top: height * 0.02),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(57, 226, 14, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Validate',
                    // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? width * 0.03
                            : largeLayout
                                ? 18
                                : 16),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.006),
          isTimer
              ? FittedBox(
                  child: Text(
                    'Didn\'t Receive OTP? Request Another in $seconds seconds',
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 206, 206),
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04),
                  ),
                )
              : InkWell(
                  onTap: () async {
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    var data = {
                      'email': localStorage.getString('registeredEmail')
                    };
                    Provider.of<Network>(context, listen: false)
                        .forgotPassword(data, 'api/forgot-password-send-otp/');

                    setState(() {
                      isTimer = !isTimer;
                      seconds = 60;
                    });
                    requestTimer();
                  },
                  child: Text(
                    'Didn\'t Receive OTP? Request Another',
                    style: TextStyle(
                        color: const Color.fromRGBO(154, 154, 154, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04),
                  ),
                )
        ],
      ),
    );
  }

  void changePassword(String newPassword, String confirmedPassword) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var otp = _firstPin! + _secondPin! + _thirdPin! + _fourthPin!;

    var data = {
      'email': localStorage.getString('registeredEmail'),
      'otp': otp,
      'new_password': newPassword,
      'confirm_password': confirmedPassword
    };

    print('DATA: $data');

    var response = await Provider.of<Network>(context, listen: false)
        .resetPassword(data, 'api/reset-password-with-otp/');

    var responseData = json.decode(response.body);

    print('CHANGE PASSWORD RESPONSE: $responseData');

    if (responseData['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(responseData['message']),
      ));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignIn()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(responseData['message']),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () => Navigator.of(context).pop()),
      ));
    }
  }
}

// void resendOtp(mobile) {
// }
