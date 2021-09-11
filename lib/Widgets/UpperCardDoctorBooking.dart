import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:marquee/marquee.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:shimmer/shimmer.dart';

class UpperCardDoctorBooking extends StatelessWidget {
  final ClinicLocationAndDoctor clinic;
  final DoctorDetails doctor;
  final BuildContext context;

  const UpperCardDoctorBooking(
      {Key key, this.clinic, this.doctor, this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Color(0xFF5D5FEF),
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 5,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: clinic?.clinicImage ?? "",
                    fit: BoxFit.fill,
                    height: 90,
                    width: width * 0.3,
                    placeholder: (context, url) => new SizedBox(
                      height: 200,
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
            ),
            Flexible(
              flex: 11,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF5D5FEF),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10))),
                // margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                text: clinic?.clinicName ?? "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
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
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height: 20,
                                      child: MarqueeText(
                                          speed: 10,
                                          text: clinic?.address ?? "",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400)),
                                    )
                                  ]),
                            ),
                          ),
                        ]),
                    Text(doctor?.name ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    MarqueeText(
                        text: doctor?.specialization ?? "",
                        speed: 7,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
