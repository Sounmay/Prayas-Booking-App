import 'package:flutter/material.dart';

class ServiceDetailsParlour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            title: Text('Parlour Services'),
            actions: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.asset('assets/Ellipse3.png'))
            ],
          )),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Personal Number',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 3.0),
                      borderRadius: BorderRadius.circular(10))),
              validator: (val) =>
                  val.isEmpty ? 'Enter Your RSP Personal Number' : null,
              onChanged: (val) {}),
        ],
      ),
    );
  }
}
