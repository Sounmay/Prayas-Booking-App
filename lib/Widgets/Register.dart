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
    return loading
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                title: Text('Sign Up'),
                elevation: 0.0,
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Sign In'),
                    onPressed: () {
                      widget.toggleView();
                    },
                  )
                ]),
            body: SingleChildScrollView(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 15.0),
                      TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Name',
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 1.0),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 3.0),
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Name' : null,
                          onChanged: (val) {
                            setState(() => name = val);
                          }),
                      SizedBox(height: 18.0),
                      TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Personal No.',
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 1.0),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 3.0),
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (val) => val.isEmpty
                              ? 'Enter your RSP Personal No.'
                              : null,
                          onChanged: (val) {
                            setState(() => number = val);
                          }),
                      SizedBox(height: 18.0),
                      TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Password',
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 1.0),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 3.0),
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (val) => val.length < 6
                              ? 'Enter password of 6+ characters'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 18.0),
                      RaisedButton(
                        color: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 25),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
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
                      SizedBox(height: 20.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ]),
                  )),
            ),
          );
  }
}
