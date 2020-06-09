import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    title: "Statefull App",
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "StateFull Digit",
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Favcity(),
    ),
  ));
}

class Favcity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Favcitystate();
  }
}

class _Favcitystate extends State<Favcity> {
  String Name = "";
  var _currencies = ["Rupees", "Dollar","Euro"];
  var _currentitem = "Rupees";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
        child: Column(
      children: <Widget>[
        TextField(
          onChanged: (String userInput) {
            setState(() {
              Name = userInput;
            });
          },
        ),
        DropdownButton<String>(
            items: _currencies.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String newValueSelected){
              setState(() {
                _currentitem = newValueSelected;
              });
            },
            value: _currentitem,
            ),
        Padding(padding: EdgeInsets.all(30.0),
        child: Text(
          "Your best City is $Name",
          style: TextStyle(fontSize: 20.0),
        )
        )
      ],
    ));
  }
}
