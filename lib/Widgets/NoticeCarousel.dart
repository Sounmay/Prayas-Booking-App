import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'D:/AndSt Projects/BookingApp/freelance_booking_app/assets/doctor.png',
  'D:/AndSt Projects/BookingApp/freelance_booking_app/assets/doctor.png',
  'D:/AndSt Projects/BookingApp/freelance_booking_app/assets/doctor.png',
  'D:/AndSt Projects/BookingApp/freelance_booking_app/assets/doctor.png',
  'D:/AndSt Projects/BookingApp/freelance_booking_app/assets/doctor.png',
];


final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    color: Color(0xff0F2735),
    child: Stack(
      children: [
        Container(
          width: 40,
          color: Color(0xff0F2735),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/parlourThumbnail.png'),
                      alignment: Alignment.topRight,
                      fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(200, 200)
                  )
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Color(0xff5D5FEF),
            ),
            width: 250,
            height: 25,
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 15.0,),
                SizedBox(width: 2.0),
                Text("Location of Clinic shown here",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
          child: Text(
            'Clinic Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
  )
)).toList();

class NoticeCarousel extends StatefulWidget {
  @override
  _NoticeCarouselState createState() => _NoticeCarouselState();
}

class _NoticeCarouselState extends State<NoticeCarousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blueGrey.withOpacity(0.1),
          height: MediaQuery.of(context).size.height*0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.5,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: imageSliders,
          )
      ),
    );
  }
}
