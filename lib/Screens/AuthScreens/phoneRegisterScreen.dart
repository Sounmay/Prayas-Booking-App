import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Screens/AuthScreens/OtpScreen.dart';
import 'package:freelance_booking_app/Widgets/Login.dart';
import 'package:freelance_booking_app/Widgets/Register.dart';

class PhoneRegisterScreen extends StatefulWidget {
  final User user;
  PhoneRegisterScreen({this.user});
  @override
  _PhoneRegisterScreenState createState() => _PhoneRegisterScreenState();
}

class _PhoneRegisterScreenState extends State<PhoneRegisterScreen> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController textEditingController = TextEditingController();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xff5D5FEF),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  key: _formKey,
                  child: Column(children: [
                    Image.asset(
                      'assets/ps logo 300x300.png',
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(
                      height: deviceHeight * 0.025,
                    ),
                    Container(
                      height: 70,
                      child: TextField(
                        onTap: () {
                          setState(() {
                            show = true;
                          });
                        },
                        controller: textEditingController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.call),
                            // hintText: "Phone Number",
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.transparent,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0F2735))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF0F2735))),
                            prefix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "+91  ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Container(
                                  height: 24,
                                  width: 2,
                                  color: Colors.blue,
                                ),
                                Text(" ")
                              ],
                            ),
                            labelText: "Phone Number",
                            labelStyle: TextStyle(color: Colors.black)),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 38),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OtpScreen(
                                  phoneNumber: textEditingController.text,
                                  user: widget.user,
                                )));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xFF0F2735)),
                        child: Center(
                          child: Text("Login With Otp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25)),
                        ),
                      ),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget _space(double d) {
    return SizedBox(
      height: d,
    );
  }
}
