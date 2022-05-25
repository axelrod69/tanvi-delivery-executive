import 'package:flutter/material.dart';
import '../widgets/changePasswordWidget.dart';

// class Password extends StatefulWidget {
//   PasswordState createState() => PasswordState();
// }

class Password extends StatelessWidget {
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
              'Change Password To Continue',
              // textScaleFactor: textScaleFactor,
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(154, 154, 154, 1),
                  fontSize: 20),
            ),
            SizedBox(height: height * 0.04),
            ChangePassword(),
          ],
        ),
      ),
    );
  }
}
