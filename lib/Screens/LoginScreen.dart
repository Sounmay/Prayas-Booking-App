import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
                'This will login screen, please add routes and start working on your respective pages, use flatbuttons to navigate to your page for now!!'),
          ),
          FlatButton(
            child: Text('Service Details'),
            onPressed: () => Navigator.pushNamed(context, '/serviceDetails'),
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          FlatButton(
            child: Text('Calander Details'),
            onPressed: () => Navigator.pushNamed(context, '/bookAppointment'),
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          )
        ],
      ),
    );
  }
}
