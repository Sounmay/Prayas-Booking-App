import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app/Widgets/LocationNameWidget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  final thisFocusnode = FocusNode();

  bool isStart;

  @override
  void initState() {
    // TODO: implement initState
    isStart = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isStart) {
      FocusScope.of(context).requestFocus(thisFocusnode);
      isStart = false;
    }
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(6)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(6))),
                          onChanged: (val) {}),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
