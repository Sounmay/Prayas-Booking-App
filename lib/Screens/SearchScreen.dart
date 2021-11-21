import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Models/Medical.dart';
import 'package:freelance_booking_app/Models/Parlour.dart';
import 'package:freelance_booking_app/Models/Salon.dart';
import 'package:freelance_booking_app/Widgets/ClinicListDoctor.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';
import 'package:freelance_booking_app/Widgets/ServiceListDoctor.dart';
import 'package:freelance_booking_app/Widgets/ServiceListParlour.dart';
import 'package:freelance_booking_app/Widgets/ServiceListSalon.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  final thisFocusnode = FocusNode();

  List<dynamic> filtereList = [];

  List<Medical> filteredMedicalService = [];
  List<Parlour> filteredParlourService = [];
  List<Salon> filteredSalonService = [];
  void searchMedical(
        List<Medical> medicalFirebaseServiceList,
        List<Parlour> parlourFirebaseServiceList,
        List<Salon> salonFirebaseServiceList
      ) {
        final medicalservice = medicalFirebaseServiceList.where((element) {
        final clinicNameLower = element?.clinicName?.toLowerCase() ?? "";
        final searchLower = _textController.text.toLowerCase();

        // ignore: unrelated_type_equality_checks
        if (searchLower == "" || element.status!="Accepted") {
          return false;
        }

        return clinicNameLower.contains(searchLower);
        }).toList();
        final salonservice = salonFirebaseServiceList.where((element) {
          final clinicNameLower = element?.salonName?.toLowerCase() ?? "";
          final searchLower = _textController.text.toLowerCase();

          if (searchLower == "" || element.status!="Accepted") {
            return false;
          }

          return clinicNameLower.contains(searchLower);
        }).toList();
        final parlourservice = parlourFirebaseServiceList.where((element) {
          final clinicNameLower = element?.parlourName?.toLowerCase() ?? "";
          final searchLower = _textController.text.toLowerCase();

          if (searchLower == "" || element.status!="Accepted") {
            return false;
          }

          return clinicNameLower.contains(searchLower);
        }).toList();
        filtereList = [];
        if (medicalservice.length != 0) {
          filtereList.addAll(medicalservice);
        }
        if (parlourservice.length != 0) {
          filtereList.addAll(parlourservice);
        }

        if (salonservice.length != 0) {
          filtereList.addAll(salonservice);
        }
        setState(() {});
      }
  bool isStart;

  @override
  void initState() {
    // TODO: implement initState
    isStart = true;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isStart) {
      FocusScope.of(context).requestFocus(thisFocusnode);
      isStart = false;
    }

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final medicalFirebaseServiceList =
        Provider.of<List<Medical>>(context, listen: false);
    final parlourFirebaseServiceList =
        Provider.of<List<Parlour>>(context, listen: false);
    final salonFirebaseServiceList =
        Provider.of<List<Salon>>(context, listen: false);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.requestFocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                LocationNameWidget(),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              if (_textController.text == "") {
                                FocusManager.instance.primaryFocus?.unfocus();
                              } else {
                                _textController.clear();
                              }
                              if (!thisFocusnode.hasFocus) {
                                Navigator.pop(context);
                              }
                            })),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            height: 70,
                            child: TextFormField(
                              focusNode: thisFocusnode,
                              key: _formKey,
                              controller: _textController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: new Icon(Icons.search),
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'Search for a service',
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey, width: 1.0),
                                      borderRadius: BorderRadius.circular(6)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(6))),
                              onChanged: (val) => searchMedical(
                                  medicalFirebaseServiceList,
                                  parlourFirebaseServiceList,
                                  salonFirebaseServiceList),
                            ),
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  child: Container(
                      height: 500,
                      child: ListView.builder(
                        itemCount: filtereList.length,
                        itemBuilder: (_, index) {
                          if (filtereList[index].type == 'salon') {
                            return ServiceListSalon(
                              service: filtereList[index],
                            );
                          }
                          if (filtereList[index].type == 'parlour') {
                            return ServiceListParlour(
                              service: filtereList[index],
                            );
                          }
                          return ClinicListDoctor(
                            service: filtereList[index],
                          );
                        },
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
