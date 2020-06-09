import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator",
      theme: ThemeData(
          primaryColor: Colors.green,
          backgroundColor: Colors.lightGreenAccent,
          buttonColor: Colors.lightGreen,
          accentColor: Colors.lightGreen),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Simple Interest Calculator",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: SIform(),
      )));
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIformState();
  }
}

class _SIformState extends State<SIform> {
  var _currencies = ["Rupees", "Dollar", "Euro"];
  var _currentitemselected = "Rupees";
  final _minpad = 5.0;
  TextEditingController _principalController = TextEditingController();
  TextEditingController _roiController = TextEditingController();
  TextEditingController _termController = TextEditingController();
  var DisplayResult = " ";
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              getImageAsset(),
              Padding(
                  padding: EdgeInsets.only(top: _minpad, bottom: _minpad),
                  child: TextField(
                      style: textStyle,
                      controller: _principalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Principal",
                          hintText: "Enter Principal e.g. 1200",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))))),
              Padding(
                  padding: EdgeInsets.only(top: _minpad, bottom: _minpad),
                  child: TextField(
                      style: textStyle,
                      controller: _roiController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Rate of Interest",
                          hintText: "In Percent",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))))),
              Padding(
                  padding: EdgeInsets.only(top: _minpad, bottom: _minpad),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                              controller: _termController,
                              style: textStyle,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: "Term",
                                  hintText: "Time in Years",
                                  labelStyle: textStyle,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))))),
                      Container(width: _minpad * 5),
                      Expanded(
                          child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: textStyle,
                            ),
                          );
                        }).toList(),
                        value: _currentitemselected,
                        onChanged: (String newValueSelected) {
                          _onDropDownItemSelected(newValueSelected);
                        },
                      ))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: _minpad, bottom: _minpad),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                              elevation: 6.0,
                              child: Text(
                                "Calculate",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  this.DisplayResult = _calculateTotalReturn();
                                });
                              })),
                      Container(
                        width: _minpad * 5,
                      ),
                      Expanded(
                          child: RaisedButton(
                              elevation: 6.0,
                              child: Text(
                                "Reset",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                setState(() {
                                  _reset();
                                });
                              }))
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(_minpad * 5),
                child: Text(DisplayResult, style: textStyle),
              )
            ])));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("Images/money.png");
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minpad * 10),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentitemselected = newValueSelected;
    });
  }

  String _calculateTotalReturn() {
    double principal = double.parse(_principalController.text);
    double roi = double.parse(_principalController.text);
    double term = double.parse(_principalController.text);
    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result = "The SI is $totalAmountPayable";
    return result;
  }

  void _reset(){
    _principalController.text = " ";
    _termController.text = " ";
    _roiController.text = " ";
    _currentitemselected = _currencies[0];
    DisplayResult =" ";
  }
}
