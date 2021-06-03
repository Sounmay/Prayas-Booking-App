import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      height: 70,
      child: TextFormField(
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
          onChanged: (val) {}),
    );
  }
}
