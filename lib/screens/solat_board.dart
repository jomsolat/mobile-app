import 'package:flutter/material.dart';
import 'package:jomsolat/solat_service.dart';
import 'package:jomsolat/functions.dart';
import 'package:jomsolat/constants.dart';
import 'package:jomsolat/screens/change_zone.dart';
import 'package:jomsolat/screens/about.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SolatBoard extends StatefulWidget {
  SolatBoard({Key? key}) : super(key: key);

  @override
  _SolatBoardState createState() => _SolatBoardState();
}

class _SolatBoardState extends State<SolatBoard> {
  late Future<Solat> futureSolat;
  var _zoneId;

  @override
  void initState() {
    super.initState();
    futureSolat = fetchSolat(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<Solat>(
              future: futureSolat,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String timeImsak =
                      solatTime(snapshot.data!.date, snapshot.data!.imsak);
                  String timeSubuh =
                      solatTime(snapshot.data!.date, snapshot.data!.subuh);
                  String timeSyuruk =
                      solatTime(snapshot.data!.date, snapshot.data!.syuruk);
                  String timeZohor =
                      solatTime(snapshot.data!.date, snapshot.data!.zohor);
                  String timeAsar =
                      solatTime(snapshot.data!.date, snapshot.data!.asar);
                  String timeMaghrib =
                      solatTime(snapshot.data!.date, snapshot.data!.maghrib);
                  String timeIsyak =
                      solatTime(snapshot.data!.date, snapshot.data!.isyak);
                  return Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/jomsolat-logo.png'),
                        Text(
                          snapshot.data!.title,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_zoneId != null) {
                                print('Refresh ' + _zoneId);
                                futureSolat = fetchSolat(_zoneId);
                              }
                            });
                          },
                          child: Text(
                            solatDate(snapshot.data!.date),
                            style: TextStyle(
                              color: Colors.green.shade500,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          snapshot.data!.location,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Imsak',
                              style: kTextStyle30,
                            ),
                            SizedBox(width: 30),
                            Text(
                              timeImsak,
                              style: kTextStyle30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subuh',
                              style: kTextStyle30,
                            ),
                            SizedBox(width: 30),
                            Text(
                              timeSubuh,
                              style: kTextStyle30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Syuruk',
                              style: kTextStyle30,
                            ),
                            SizedBox(width: 30),
                            Text(
                              timeSyuruk,
                              style: kTextStyle30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Zohor',
                              style: kTextStyle30,
                            ),
                            SizedBox(width: 30),
                            Text(
                              timeZohor,
                              style: kTextStyle30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Asar',
                              style: kTextStyle30,
                            ),
                            SizedBox(width: 30),
                            Text(
                              timeAsar,
                              style: kTextStyle30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Maghrib',
                              style: kTextStyle30,
                            ),
                            SizedBox(width: 30),
                            Text(
                              timeMaghrib,
                              style: kTextStyle30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Isyak',
                              style: kTextStyle30,
                            ),
                            SizedBox(width: 30),
                            Text(
                              timeIsyak,
                              style: kTextStyle30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 50.0,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Zon',
          ),
        ],
        selectedItemColor: Colors.green.shade600,
        unselectedItemColor: Colors.green.shade600,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) async {
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return About();
      }));
    }
    if (index == 1) {
      setState(() {
        if (_zoneId != null) {
          print('Refresh ' + _zoneId);
          futureSolat = fetchSolat(_zoneId);
        }
      });
    }
    if (index == 2) {
      var zoneId =
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ChangeZone();
      }));
      setState(() {
        if (zoneId != null) {
          _zoneId = zoneId;
          futureSolat = fetchSolat(zoneId);
        }
      });
    }
  }
}
