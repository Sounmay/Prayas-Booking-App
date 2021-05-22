import 'package:flutter/material.dart';

class ServiceCardDetailsCenterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Card(
        shadowColor: Colors.yellow,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/Ellipse.png',
                  width: 113,
                  height: 130,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text('Sec 19, near library')]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Shri Clinic'), Text('\u{2B50} 4.0')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Visiting hour'),
                          Text('10:00 AM - 5:00PM')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Days'), Text('MON-THU')],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
