import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, '/wrapper');
    });
    return Scaffold(
      body: Container(
        color: Color(0xff5D5FEF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/splashLogo.png',
              height: 100,
              width: 100,
            )),
          ],
        ),
      ),
    );
  }
}
