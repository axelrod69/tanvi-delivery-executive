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
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
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
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Welcome',
                  // textScaleFactor: textScaleFactor,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Login to start Delivering',
                  // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(154, 154, 154, 1),
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            FormWidget(),
            SizedBox(height: height * 0.01),
            const Text(
              'Forgot your password?',
              textAlign: TextAlign.center,
              // textScaleFactor: textScaleFactor,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed('/home-screen'),
                child: Container(
                  width: double.infinity,
                  height: !tabLayout && !largeLayout
                      ? height * 0.08
                      : height * 0.07,
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
      ),
    );
  }
}
