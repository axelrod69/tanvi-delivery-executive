import 'package:flutter/material.dart';
import '../widgets/register.dart';

class EditDetails extends StatefulWidget {
  EditDetailsState createState() => EditDetailsState();
}

class EditDetailsState extends State<EditDetails> {
  bool valueOne = false;
  bool valueTwo = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final sex = ['Male', 'Female', 'Rather Not Say'];
  String? value;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              // color: Colors.red,
              margin: EdgeInsets.only(top: height * 0.05),
              padding:
                  EdgeInsets.only(left: width * 0.05, right: height * 0.03),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.004),
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
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            hintText: 'Enter Your Name',
                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                      ),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      width: double.infinity,
                      height: height * 0.11,
                      // color: Colors.amber,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(
                              // color: Colors.green,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'DOB',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(height: height * 0.012),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.02,
                                        right: width * 0.02),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: width * 0.02,
                                          top: height * 0.004),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
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
                                        keyboardType: TextInputType.name,
                                        decoration: const InputDecoration(
                                            hintText: 'DD/MM/YYYY',
                                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                                            // label: Text(
                                            //   'Enter Your Phone Number',
                                            //   textScaleFactor: textScaleFactor,
                                            //   style: const TextStyle(color: Colors.grey),
                                            // ),
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none),
                                        // onFieldSubmitted: (_) =>
                                        //     FocusScope.of(context).requestFocus(_focusFirst),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              // color: Colors.blue,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'SEX',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(height: height * 0.012),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.02),
                                    child: Container(
                                      height: height * 0.06,
                                      padding: EdgeInsets.only(
                                          left: width * 0.02,
                                          top: height * 0.004),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                // color: Color.fromRGBO(227, 189, 255, 0.5),
                                                offset: Offset(1, 2))
                                          ]),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: value,
                                          items: sex
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (value) => setState(() {
                                            this.value = value;
                                          }),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.012),
                    const Text(
                      'Aadhaar Number',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.004),
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
                            hintText: '4xxx5xxx6xxx7xxx',

                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Driving License',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.004),
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
                            hintText: '4xxx5xxx6xxx7xxx',

                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'PAN Card Number',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.004),
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
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'ABCD5xxx6xxx',

                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Full Address',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.004),
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
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                            hintText: 'Enter Address',

                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Phone Number',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.004),
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
                            hintText: '9876543210',

                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      'Email',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: height * 0.012),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.02, top: height * 0.004),
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'abcd@email.com',

                            // suffixIcon: Icon(Icons.send, color: Colors.green),
                            // label: Text(
                            //   'Enter Your Phone Number',
                            //   textScaleFactor: textScaleFactor,
                            //   style: const TextStyle(color: Colors.grey),
                            // ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none),
                        // onFieldSubmitted: (_) =>
                        //     FocusScope.of(context).requestFocus(_focusFirst),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            ListTile(
              leading: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  value: valueOne,
                  onChanged: (value) {
                    setState(() {
                      this.valueOne = value!;
                    });
                  }),
              title: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: height * 0.02),
            ListTile(
              leading: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  value: valueTwo,
                  onChanged: (value) {
                    setState(() {
                      this.valueTwo = value!;
                    });
                  }),
              title: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding:
                  EdgeInsets.only(left: width * 0.08, right: height * 0.04),
              child: Container(
                width: double.infinity,
                height: height * 0.06,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 230, 59),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02)
          ],
        ),
      ),
    );
  }
}
