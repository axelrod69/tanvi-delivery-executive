import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/sign_in.dart';
// import './signUp.dart';

// class SignIn extends StatefulWidget {
//   SignInState createState() => SignInState();
// }

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
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
              onTap: () => Navigator.of(context).pushNamed('/change-password'),
              child: const Text(
                'Forgot your password?',
                textAlign: TextAlign.center,
                // textScaleFactor: textScaleFactor,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(height: height * 0.04),
            // // Row(
            // //   mainAxisAlignment: MainAxisAlignment.center,
            // //   children: [
            // //     Text(
            // //       'Dont\'t have an account?',
            // //       textAlign: TextAlign.center,
            //       textScaleFactor: textScaleFactor,
            // //       style: const TextStyle(color: Colors.grey),
            // //     ),
            // //     InkWell(
            // //       onTap: () => Navigator.of(context).pushNamed('/sign-up'),
            // //       child: Text(
            // //         'Sign Up',
            // //         textAlign: TextAlign.center,
            //         textScaleFactor: textScaleFactor,
            // //         style: const TextStyle(
            // //             color: Colors.grey, fontWeight: FontWeight.bold),
            // //       ),
            // //     ),
            // //   ],
            // // ),
            // // SizedBox(height: height * 0.04),
            // // Row(
            // //   mainAxisAlignment: MainAxisAlignment.center,
            // //   children: [
            // //     Container(
            // //       width: width * 0.18,
            // //       height: height * 0.065,
            // //       padding: EdgeInsets.only(
            // //           top: height * 0.02, bottom: height * 0.02),
            // //       decoration: BoxDecoration(
            // //           color: Colors.white,
            // //           borderRadius: BorderRadius.circular(10),
            // //           boxShadow: const [
            // //             BoxShadow(
            // //                 color: Colors.grey,
            // //                 spreadRadius: 2,
            // //                 blurRadius: 4,
            // //                 offset: Offset(0, 1))
            // //           ]),
            // //       child: Center(
            // //         child: Image.asset(
            // //             'assets/images/facebook-logo-transparent.png'),
            // //       ),
            // //     ),
            // //     SizedBox(width: width * 0.04),
            // //     Container(
            // //       width: width * 0.18,
            // //       height: height * 0.065,
            // //       padding: EdgeInsets.only(
            // //           top: height * 0.02, bottom: height * 0.02),
            // //       decoration: BoxDecoration(
            // //           color: Colors.white,
            // //           borderRadius: BorderRadius.circular(10),
            // //           boxShadow: const [
            // //             BoxShadow(
            // //                 color: Colors.grey,
            // //                 spreadRadius: 2,
            // //                 blurRadius: 4,
            // //                 offset: Offset(0, 1))
            // //           ]),
            // //       child: Center(
            // //         child: Image.asset('assets/images/google-logo.png'),
            // //       ),
            // //     )
            // //   ],
            // // )
          ],
        ),
      ),
    );
  }
}
