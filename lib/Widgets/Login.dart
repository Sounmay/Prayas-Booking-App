import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Providers/authProvider.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthProvider _auth = AuthProvider();
  final _formKey = GlobalKey<FormState>();
  String number = '';
  String password = '';
  String error = '';
  bool loading = false;

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
                  height: deviceHeight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xff5D5FEF),
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
                        Text("Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 28)),
                        Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
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
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(0),
                                        prefixIcon: Icon(Icons.call),
                                        hintText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF0F2735))),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF0F2735)))),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter Your Mobile Number'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => number = val);
                                    }),
                                SizedBox(height: 20.0),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Row(children: [
                                      Text(
                                        "Enter Password",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ])),
                                TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 10),
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
                                Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Forgot Password?",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ])),
                                SizedBox(height: 20.0),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      backgroundColor: Color(0xFF0F2735),
                                    ),
                                    child: Text(
                                      'Cotninue',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 25),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        String numemail = number + "@gmail.com";
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                numemail, password);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'could not sign in with the credentials';
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  error,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14.0),
                                ),
                                SizedBox(height: 15.0),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Or, If you are a new user, ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          widget.toggleView();
                                        },
                                        child: Text('Register',
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
                      ]),
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
