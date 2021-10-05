import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('About Us', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Center(
                child: Column(
                  children: [
                    Text('Owned by', style: TextStyle(fontSize: 10, color: Color(0xff5D5FEF)),),
                    SizedBox(height: 20,),
                    Text('Suman Bhowal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: MediaQuery.of(context).size.width*0.5,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Center(
                child: Column(
                  children: [
                    Text('Designed and Directed by', style: TextStyle(fontSize: 10, color: Color(0xff5D5FEF)),),
                    SizedBox(height: 20,),
                    Text('Aswin Kumar Raju', style: TextStyle(fontSize: 20,),),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: MediaQuery.of(context).size.width*0.5,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Center(
                child: Column(
                  children: [
                    Text('Designed by', style: TextStyle(fontSize: 10, color: Color(0xff5D5FEF)),),
                    SizedBox(height: 20,),
                    Text('Prithvi Raj Naik', style: TextStyle(fontSize: 20,),),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: MediaQuery.of(context).size.width*0.5,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Center(
                child: Column(
                  children: [
                    Text('Developed by', style: TextStyle(fontSize: 10, color: Color(0xff5D5FEF)),),
                    SizedBox(height: 20,),
                    Text('Sounmay Mishra', style: TextStyle(fontSize: 20,),),
                    Text('Naiyar Imam', style: TextStyle(fontSize: 20,),),
                    Text('Snigdha Barik', style: TextStyle(fontSize: 20,),),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
