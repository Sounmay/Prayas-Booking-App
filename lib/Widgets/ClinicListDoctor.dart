import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Screens/ClinicDoctorsListPage.dart';
import 'package:marquee/marquee.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:shimmer/shimmer.dart';

class ClinicListDoctor extends StatelessWidget {
  final Medical service;
  const ClinicListDoctor({Key key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // print(service.id);
        // Navigator.of(context).pushNamed('/serviceDetailsParlour',
        //     arguments: {'details': service});
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClinicDoctorListPage(
                      clinicDetails: service,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: service.image,
                    fit: BoxFit.fill,
                    height: 100,
                    width: double.infinity,
                    placeholder: (context, url) => new SizedBox(
                      height: 100,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Icon(Icons.image, size: 40),
                            ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: Container(
                                  color: Colors.grey[200].withOpacity(0.1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        new Image.asset('assets/parlourTile.png'),
                  ),
                ),
              ),
              Flexible(
                flex: 11,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF5D5FEF),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  // margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: width * 0.14,
                                height: 20,
                                child: MarqueeText(
                                  speed: 10,
                                  text: service.clinicName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text('\u{2B50}   4.4',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            )
                          ]),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.location,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 20,
                                    child: MarqueeText(
                                        speed: 10,
                                        alwaysScroll: false,
                                        text: service.location,
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                  )
                                ]),
                          ),
                        ],
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
