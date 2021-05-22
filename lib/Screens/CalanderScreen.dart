import 'package:flutter/material.dart';

class CalanderScreen extends StatefulWidget {
  @override
  _CalanderScreenState createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calander'),
      ),
      body: Column(
        children: [Container(child: Text('Write code here...'))],
      ),
    );
  }
}
