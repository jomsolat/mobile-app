import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'solat_service.dart';
import 'functions.dart';

void main() => runApp(JomSolatApp());

class JomSolatApp extends StatefulWidget {
  JomSolatApp({Key? key}) : super(key: key);

  @override
  _JomSolatAppState createState() => _JomSolatAppState();
}

class _JomSolatAppState extends State<JomSolatApp> {
  late Future<Solat> futureSolat;

  @override
  void initState() {
    super.initState();
    // TODO: Pass 'zoneId' to fetchSolat() to get dynamic solat time
    futureSolat = fetchSolat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jom Solat',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Solat>(
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
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        solatDate(snapshot.data!.date),
                        style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
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
                            style: textStyle30,
                          ),
                          SizedBox(width: 30),
                          Text(
                            timeImsak,
                            style: textStyle30,
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
                            style: textStyle30,
                          ),
                          SizedBox(width: 30),
                          Text(
                            timeSubuh,
                            style: textStyle30,
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
                            style: textStyle30,
                          ),
                          SizedBox(width: 30),
                          Text(
                            timeSyuruk,
                            style: textStyle30,
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
                            style: textStyle30,
                          ),
                          SizedBox(width: 30),
                          Text(
                            timeZohor,
                            style: textStyle30,
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
                            style: textStyle30,
                          ),
                          SizedBox(width: 30),
                          Text(
                            timeAsar,
                            style: textStyle30,
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
                            style: textStyle30,
                          ),
                          SizedBox(width: 30),
                          Text(
                            timeMaghrib,
                            style: textStyle30,
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
                            style: textStyle30,
                          ),
                          SizedBox(width: 30),
                          Text(
                            timeIsyak,
                            style: textStyle30,
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
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
