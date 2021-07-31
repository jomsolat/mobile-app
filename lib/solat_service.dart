import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Solat> fetchSolat() async {
  // TODO: change url to get zone from function parameter for dynamic call
  final response =
      await http.get(Uri.parse('https://api.jomsolat.org/zone/PRK06'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Solat.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Solat data');
  }
}

class Solat {
  final String title;
  final String date;
  final String location;
  final String imsak;
  final String subuh;
  final String syuruk;
  final String zohor;
  final String asar;
  final String maghrib;
  final String isyak;

  Solat({
    required this.title,
    required this.date,
    required this.location,
    required this.imsak,
    required this.subuh,
    required this.syuruk,
    required this.zohor,
    required this.asar,
    required this.maghrib,
    required this.isyak,
  });

  factory Solat.fromJson(Map<String, dynamic> json) {
    return Solat(
      title: 'Waktu Solat Hari Ini',
      date: json['date'],
      location: json['zoneName'],
      imsak: json['imsak'],
      subuh: json['fajr'],
      syuruk: json['syuruk'],
      zohor: json['dhuhr'],
      asar: json['asr'],
      maghrib: json['maghrib'],
      isyak: json['isha'],
    );
  }
}
