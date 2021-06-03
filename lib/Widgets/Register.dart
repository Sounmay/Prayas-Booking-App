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
                color: Colors.white,
              )
            ]),
          )
        : Scaffold(
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
                          'assets/splashLogo.png',
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
                                      borderSide:
                                          BorderSide(color: Color(0xFF0F2735))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF0F2735))),
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
                                      borderSide:
                                          BorderSide(color: Color(0xFF0F2735))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF0F2735))),
                                ),
                                validator: (val) => val.isEmpty
                                    ? 'Enter your RSP Personal No.'
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
                                      borderSide:
                                          BorderSide(color: Color(0xFF0F2735))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF0F2735))),
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
                                  'Continue',
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
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    print(name);
                                    print(number);
                                    print(password);
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            name, false, number, password);
                                    if (result == null) {
                                      setState(() {
                                        error = 'please supply a valid email';
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
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
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
