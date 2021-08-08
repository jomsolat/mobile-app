import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangeZone extends StatefulWidget {
  @override
  _ChangeZoneState createState() => _ChangeZoneState();
}

class _ChangeZoneState extends State<ChangeZone> {
  @override
  void initState() {
    _getStateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: 20, top: 100),
            child: Text(
              'Tetapan Zon',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          //======================================================== State

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myState,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        hint: Text('Pilih Negeri'),
                        onChanged: (newValue) {
                          setState(() {
                            _myState = newValue;
                            _myCity = null;
                            _getCitiesList();
                          });
                        },
                        items: statesList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item['name']),
                            value: item['id'].toString(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          //======================================================== City

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myCity,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        hint: Text('Pilih Zon'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _myCity = newValue!;
                            print(_myCity);
                          });
                        },
                        isExpanded: true,
                        items: citiesList.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['name']),
                            value: item['id'].toString(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 35,
            color: Colors.green.shade500,
            child: Text(
              'OK',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              Navigator.pop(context, _myCity);
            },
          ),
        ],
      ),
    );
  }

  //=============================================================================== Api Calling here

//CALLING STATE API HERE
// Get State information by API
  List statesList = [];
  var _myState;

  Object stateJson = {
    "state": [
      {"id": 1, "name": "Johor"},
      {"id": 2, "name": "Kedah"},
      {"id": 3, "name": "Kelantan"},
      {"id": 4, "name": "Melaka"},
      {"id": 5, "name": "Negeri Sembilan"},
      {"id": 6, "name": "Pahang"},
      {"id": 7, "name": "Perlis"},
      {"id": 8, "name": "Pulau Pinang"},
      {"id": 9, "name": "Perak"},
      {"id": 10, "name": "Sabah"},
      {"id": 11, "name": "Selangor"},
      {"id": 12, "name": "Sarawak"},
      {"id": 13, "name": "Terengganu"},
      {"id": 14, "name": "Wilayah Persekutuan"}
    ]
  };

  Future<String> _getStateList() async {
    var data = await json.decode(json.encode(stateJson));
    setState(() {
      statesList = data['state'];
    });
    return '';
  }

  // Get State information by API
  List citiesList = [];
  var _myCity;

  String cityInfoUrl = 'https://api.jomsolat.org/zone/state/';
  Future<String> _getCitiesList() async {
    await http
        .get(Uri.parse(cityInfoUrl + _myState.toString()))
        .then((response) {
      var data = json.decode(response.body);
      setState(() {
        citiesList = data;
      });
    });
    return '';
  }
}
