import 'package:flutter/material.dart';
import '../model/network/authentication.dart';
import '../widgets/sign_in.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import './otpScreen.dart';

class SignIn extends StatelessWidget {
  final GlobalKey<FormState> _dialogKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  String? email;
  String? changedPassword;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          height: height * 1,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 392.png'),
                  fit: BoxFit.cover)),
          // margin: EdgeInsets.only(top: height * 0.15),
          padding: EdgeInsets.only(top: height * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                // textScaleFactor: textScaleFactor,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              const Text(
                'Login to start Delivering',
                // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(154, 154, 154, 1),
                    fontSize: 20),
              ),
              SizedBox(height: height * 0.04),
              FormWidget(),
              SizedBox(height: height * 0.01),
              InkWell(
                // onTap: () =>
                //     Navigator.of(context).pushNamed('/change-password'),
                // onTap: () => showDialog(
                //     context: context,
                //     builder: (context) => AlertDialog(
                //           title: Text('Enter Email To Continue'),
                //           actions: [
                //             Form(
                //               key: _dialogKey,
                //               child: Padding(
                //                 padding: EdgeInsets.only(
                //                     left: width * 0.04, right: width * 0.04),
                //                 child: TextFormField(
                //                   // controller: emailController,
                //                   decoration: InputDecoration(
                //                       hintText:
                //                           'Enter your registered email address'),
                //                   validator: (input) {
                //                     if (input!.isEmpty) {
                //                       return 'Please Enter your Registered Email Address';
                //                     } else {
                //                       email = input;
                //                       return null;
                //                     }
                //                   },
                //                 ),
                //               ),
                //             ),
                //             TextButton(
                //                 onPressed: () async {
                //                   SharedPreferences localStorage =
                //                       await SharedPreferences.getInstance();
                //                   if (_dialogKey.currentState!.validate()) {
                //                     var response = await Provider.of<Network>(
                //                             context,
                //                             listen: false)
                //                         .forgotPassword({'email': email},
                //                             'api/forgot-password/');
                //                     var passwordResponse =
                //                         json.decode(response.body);
                //                     print(passwordResponse);
                //                     localStorage.setString(
                //                         'uid', passwordResponse['uid'][0]);
                //                     localStorage.setString('passwordResetToken',
                //                         passwordResponse['token']);
                //                     Navigator.of(context).pop();
                //                     showDialog(
                //                         context: context,
                //                         builder: (context) => AlertDialog(
                //                               title: Text('Enter New Password'),
                //                               actions: [
                //                                 Form(
                //                                   key: _passwordKey,
                //                                   child: Padding(
                //                                     padding: EdgeInsets.only(
                //                                         left: width * 0.04,
                //                                         right: width * 0.04),
                //                                     child: TextFormField(
                //                                       // controller: emailController,
                //                                       decoration: InputDecoration(
                //                                           hintText:
                //                                               'Enter New Password'),
                //                                       validator:
                //                                           (changePassword) {
                //                                         if (changePassword!
                //                                             .isEmpty) {
                //                                           return 'Please Enter Password';
                //                                         } else if (changePassword
                //                                                 .length <
                //                                             10) {
                //                                           return 'Password must be atleast 10 characters long';
                //                                         } else {
                //                                           changedPassword =
                //                                               changePassword;
                //                                           return null;
                //                                         }
                //                                       },
                //                                     ),
                //                                   ),
                //                                 ),
                //                                 TextButton(
                //                                   onPressed: () async {
                //                                     SharedPreferences
                //                                         localStorage =
                //                                         await SharedPreferences
                //                                             .getInstance();
                //                                     if (_passwordKey
                //                                         .currentState!
                //                                         .validate()) {
                //                                       var passwordResponse =
                //                                           await Provider.of<
                //                                                       Network>(
                //                                                   context,
                //                                                   listen: false)
                //                                               .resetPassword({
                //                                         'password':
                //                                             changedPassword,
                //                                         'uidb64': localStorage
                //                                             .getString('uid'),
                //                                         'token': localStorage
                //                                             .getString(
                //                                                 'passwordResetToken'),
                //                                       }, 'api/password-reset-complete/');
                //                                       Navigator.of(context)
                //                                           .pop();
                //                                       var decodedReponse =
                //                                           json.decode(
                //                                               passwordResponse
                //                                                   .body);
                //                                       if (decodedReponse[
                //                                               'success'] ==
                //                                           'true') {
                //                                         ScaffoldMessenger.of(
                //                                                 context)
                //                                             .showSnackBar(
                //                                                 SnackBar(
                //                                           backgroundColor:
                //                                               Colors.green,
                //                                           content: Text(
                //                                               decodedReponse[
                //                                                   'message'],
                //                                               style: TextStyle(
                //                                                   color: Colors
                //                                                       .white)),
                //                                         ));
                //                                       }
                //                                       // print(json.decode(
                //                                       //     passwordResponse.body));
                //                                     }
                //                                   },
                //                                   child: Text('Ok',
                //                                       style: TextStyle(
                //                                           color: Colors.green)),
                //                                 )
                //                               ],
                //                             ));
                //                   }
                //                 },
                //                 child: Text(
                //                   'Continue',
                //                   style: TextStyle(color: Colors.green),
                //                 ))
                //           ],
                //         )),
                onTap: () async {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();

                  var email = {
                    'email': localStorage.getString('registeredEmail')
                  };

                  print('EMAIL : $email');

                  var response = await Provider.of<Network>(context,
                          listen: false)
                      .forgotPassword(email, 'api/forgot-password-send-otp/');

                  var responseData = json.decode(response.body);

                  print('FORGOT PASSWORD: $responseData');

                  if (responseData['status'] == 'warning') {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Text(responseData['message']),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK',
                                      style: TextStyle(color: Colors.green)),
                                )
                              ],
                            ));
                  } else {
                    print('SUCCESS');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            InputOTP(responseData['message'])));
                  }
                },
                child: const Text(
                  'Change Password',
                  textAlign: TextAlign.center,
                  // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
