import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Providers/cartServices.dart';
import 'package:freelance_booking_app/Providers/parlourServices.dart';
import 'package:provider/provider.dart';

class Catalogue extends StatefulWidget {
  Catalogue({Key key}) : super(key: key);

  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    final sl = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final id = args['id'];
    final getCatalogue = args['getCatalogue'];
    final shopName = args['shopName'];
    final userName = args['userName'];
    List<ParlourServiceDetails> mostAvailed = args['mostAvailed'];
    final cart = Provider.of<CartService>(context);
    final service = Provider.of<CartService>(context).services;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF0F2735),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Catalogue',
                      style: TextStyle(fontSize: 18.0, letterSpacing: 1.0)),
                ),
              ],
            )),
        body: Container(
          child: mostAvailed.length != 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: Container(
                      height: sl * 1,
                      child: ListView.builder(
                          itemCount: mostAvailed.length,
                          itemBuilder: (ctx, i) {
                            int hr = int.parse(mostAvailed[i].hour);
                            int min = int.parse(mostAvailed[i].minute);
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Container(
                                      height: 30,
                                      width: 2.3,
                                      color: Color(0xff5D5FEF),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mostAvailed[i].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "₹ " +
                                              "${mostAvailed[i].price}" +
                                              " | " +
                                              "${mostAvailed[i].hour} Hr ${mostAvailed[i].minute} Min",
                                          style: TextStyle(
                                              color: Color(0xFF606572)),
                                        )
                                      ],
                                    ),
                                  ]),
                                  getCatalogue == 2
                                      ? service[id] != null &&
                                              service[id]
                                                  .serviceName
                                                  .contains(mostAvailed[i].name)
                                          ? SizedBox(
                                              height: 30,
                                              width: 60,
                                              child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xff02CF96),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Added",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            )
                                          : SizedBox(
                                              height: 30,
                                              width: 50,
                                              child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xff5D5FEF),
                                                  ),
                                                  onPressed: () {
                                                    cart.addServices(
                                                        id,
                                                        mostAvailed[i].name,
                                                        int.parse(mostAvailed[i]
                                                            .price),
                                                        hr * 60 + min,
                                                        shopName,
                                                        userName);
                                                  },
                                                  child: Text(
                                                    "Add",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            )
                                      : SizedBox()
                                ],
                              ),
                            );
                          })),
                )
              : Container(
                  height: sl * 0.2,
                  child: Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
