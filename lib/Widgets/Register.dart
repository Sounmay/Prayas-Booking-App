import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/authProvider.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthProvider _auth = AuthProvider();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  bool agree = false;

  String name = '';
  String password = '';
  String error = '';
  String number = '';

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return loading
        ? Container(
            color: Color(0xff5D5FEF),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            ]),
          )
        : MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                    color: Color(0xff5D5FEF),
                    height: deviceHeight,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ps logo 300x300.png',
                            height: 120,
                            width: 120,
                          ),
                          SizedBox(
                            height: deviceHeight * 0.025,
                          ),
                          Text("Create an account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28)),
                          Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              SizedBox(height: 15.0),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(children: [
                                    Text(
                                      "Enter Your Name",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                              TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Name',
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                  ),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter your Name' : null,
                                  onChanged: (val) {
                                    setState(() => name = val);
                                  }),
                              SizedBox(height: 18.0),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(children: [
                                    Text(
                                      "Enter Phone Number",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                              TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Phone Number',
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                  ),
                                  validator: (val) => val.isEmpty
                                      ? 'Enter your phone no.'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => number = val);
                                  }),
                              SizedBox(height: 18.0),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Row(children: [
                                    Text(
                                      "Enter Password",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                              TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    hintText: 'Password',
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF0F2735))),
                                  ),
                                  validator: (val) => val.length < 6
                                      ? 'Enter password of 6+ characters'
                                      : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  }),
                              SizedBox(height: 18.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextButton(
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 25),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFF0F2735),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15),
                                    ),
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            StatefulBuilder(
                                                builder: (context, setState) =>
                                                    AlertDialog(
                                                      title: const Text(
                                                          'Terms and Conditions'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            new SingleChildScrollView(
                                                              child: Text(
                                                                  "By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to priya bhowal & suman bhowal.\npriya bhowal & suman bhowal is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.\nThe prayas app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the prayas app won’t work properly or at all.\nThe app does use third party services that declare their own Terms and Conditions.\nLink to Terms and Conditions of third party service providers used by the app\n•	Google Play Services\n•	Firebase Crashlytics\nYou should be aware that there are certain things that priya bhowal & suman bhowal will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but priya bhowal & suman bhowal cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.\nIf you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.\nAlong the same lines, priya bhowal & suman bhowal cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, priya bhowal & suman bhowal cannot accept responsibility.\nWith respect to priya bhowal & suman bhowal’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. priya bhowal & suman bhowal accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.\nAt some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. priya bhowal & suman bhowal does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.\nChanges to This Terms and Conditions\nI may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.\nThese terms and conditions are effective as of 2021-10-11\nContact Us\nIf you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at prayas.ps.2021@gmail.com."),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        Row(
                                                          children: [
                                                            Material(
                                                              child: Checkbox(
                                                                value: agree,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    agree =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                'I have read and accepted terms and conditions',
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        TextButton(
                                                            onPressed: agree
                                                                ? () async {
                                                                    if (_formKey
                                                                        .currentState
                                                                        .validate()) {
                                                                      _registerUser(
                                                                          context);
                                                                    }
                                                                  }
                                                                : null,
                                                            style: agree
                                                                ? ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(Colors
                                                                            .blue))
                                                                : ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(
                                                                            Colors.grey)),
                                                            child: Text(
                                                              'Accept',
                                                              style: agree
                                                                  ? TextStyle(
                                                                      color: Colors
                                                                          .white)
                                                                  : TextStyle(
                                                                      color: Colors
                                                                          .white10),
                                                            ))
                                                      ],
                                                    )))),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Or, If you have an account, ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        widget.toggleView();
                                      },
                                      child: Text('Login',
                                          style: TextStyle(
                                              color: Colors.red[800],
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    )
                                  ])
                            ]),
                          ),
                        ])),
              ),
            ),
          );
  }

  _registerUser(BuildContext context) async {
    Navigator.pop(context);
    setState(() {
      loading = true;
    });
    print(name);
    print(number);
    print(password);
    dynamic result =
        await _auth.registerWithEmailAndPassword(name, false, number, password);
    if (result == null) {
      setState(() {
        error = 'please supply a valid email';
        loading = false;
      });
    } else {
      // Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
