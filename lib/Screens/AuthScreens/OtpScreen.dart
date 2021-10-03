import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Screens/Wrapper.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
// import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final User user;
  OtpScreen({Key key, this.phoneNumber, this.user}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _verificationCode;
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F2735),
      ),
      body: Container(
        color: Color(0xff5D5FEF),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _space(12),
                  Text("OTP Verification",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 30)),
                  _space(30),
                  Text("Enter the 6 digit code sent to ",
                      style: TextStyle(
                          color: Color(0xFF0F2735),
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  _space(8),
                  Text("+91 " + widget.phoneNumber,
                      style: TextStyle(
                          color: Color(0xFF0F2735),
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  _space(8),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Edit Phone Number?",
                      style: TextStyle(
                          color: Color(0xFF0F2735),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  _space(102),
                  PinCodeTextField(
                    controller: pinController,
                    appContext: context,
                    enablePinAutofill: true,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(6),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        borderWidth: 1,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeColor: Colors.white30,
                        inactiveFillColor: Colors.white,
                        selectedColor: Colors.white30,
                        inactiveColor: Colors.transparent),
                    cursorHeight: 28,
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    // textStyle: headline5White,
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    //errorAnimationController: errorController,
                    //controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                      _verifyPin(pinController.text, widget.user);
                    },
                    onChanged: (value) {
                      // print(value);
                      // setState(() {
                      //   currentText = value;
                      // });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    onSubmitted: (pin) async {
                      _verifyPin(pin, widget.user);
                    },
                  ),
                  _space(8),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Didn't receive code?",
                          // style: bodyText2White,
                        ),
                        InkWell(
                          onTap: () {
                            print("tap");
                            pinController.clear();
                            _verifyPhone(false);
                          },
                          child: Text(
                            " Resend Code",
                            style: TextStyle(
                                color: Color(0xFF0F2735),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _space(22),
                  InkWell(
                    onTap: () {
                      _verifyPin(pinController.text, widget.user);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFF0F2735),
                      ),
                      child: Center(
                        child: Text("Verify",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  _space(30),
                  // Container(
                  //   height: 50,
                  //   child: Center(
                  //     child: InkWell(
                  //       onTap: () {
                  //         Navigator.pop(context);
                  //       },
                  //       child: Text(
                  //         "Edit Phone Number?",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final scaffoldKey = GlobalKey();

  _loadOtp() async {
    try {
      await SmsAutoFill().listenForCode;
    } catch (e) {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SmsAutoFill().unregisterListener();
  }

  @override
  void initState() {
    // TODO: implement initState
    _verifyPhone(true);
    super.initState();
    _loadOtp();
  }

  Widget _space(double d) {
    return SizedBox(
      height: d,
    );
  }

  _verifyPhone(bool isFirst) async {
    // AsyncValue<User> u = context.read(authStateProvider);
    // u.whenData((user) async {
    if (!isFirst) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text("Sending Otp..."),
          content: Container(
            height: 50,
            width: 50,
            child: Center(
              child: CircularProgressIndicator(color: Colors.blue),
            ),
          ),
        ),
      );
    }
    FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phoneNumber}',
        // autoRetrievedSmsCodeForTesting: "+916268322273",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .whenComplete(() {
            print(widget.user.phoneNumber);
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => Wrapper()),
            //     (route) => false);
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (!isFirst) Navigator.pop(context);
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              content: Material(
                color: Colors.transparent,
                child: Container(
                  height: 140,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                child: Text(
                                  "assets/icons/failed.svg",
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              e.message.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          // BotToast.showText(
          //     contentColor: almostWhite,
          //     textStyle: TextStyle(color: black),
          //     text: e.message);
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          if (!isFirst) Navigator.pop(context);
          // showCupertinoDialog(
          //   context: context,
          //   builder: (context) => CupertinoAlertDialog(
          //     content: Material(
          //       color: Colors.transparent,
          //       child: Container(
          //         height: 100,
          //         child: Stack(
          //           children: [
          //             Positioned.fill(
          //               child: Column(
          //                 mainAxisSize: MainAxisSize.min,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Container(
          //                       height: 50,
          //                       width: 50,
          //                       child: Lottie.asset(
          //                         'assets/instrument/animation_tick.json',
          //                       )),
          //                   SizedBox(
          //                     height: 16,
          //                   ),
          //                   Text(
          //                     "OTP sent successfully",
          //                     style: TextStyle(
          //                         fontSize: 16, fontWeight: FontWeight.w400),
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Positioned(
          //               top: 0,
          //               right: 0,
          //               child: InkWell(
          //                   onTap: () {
          //                     Navigator.pop(context);
          //                   },
          //                   child: Icon(Icons.close)),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // );
          // BotToast.showText(
          //     contentColor: almostWhite,
          //     textStyle: TextStyle(color: black),
          //     text: "OTP sent Successfully");
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          if (!isFirst) Navigator.pop(context);
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  Future<void> _verifyPin(String pin, User user) async {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Container(
          height: 50,
          width: 50,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: pinController.text))
          .catchError((e) {
        Navigator.pop(context);
        BotToast.showText(
            contentColor: Colors.red,
            textStyle: TextStyle(color: Colors.black),
            text: e.message,
            duration: Duration(seconds: 2));
      }).whenComplete(() async {
        // AsyncValue<User> u = context.read(authStateProvider);
        // u.whenData((value) {
        // print(widget.user.phoneNumber);
        // if (widget.user.phoneNumber != null && widget.user.phoneNumber != "")
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Wrapper()),
            (route) => false);
      });
      // });
    } catch (e) {
      FocusScope.of(context).unfocus();
      BotToast.showText(
          contentColor: Colors.red,
          textStyle: TextStyle(color: Colors.black),
          text: e.toString());
    }
  }
}
