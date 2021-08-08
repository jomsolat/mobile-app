import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'images/bismillah.png',
                width: 150.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                child: Text(
                  'https://jomsolat.org',
                  style: TextStyle(
                    color: Colors.green.shade300,
                    fontSize: 20.0,
                  ),
                ),
                onTap: () => launch('https://jomsolat.org'),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  'Aplikasi ini diberikan secara percuma tanpa apa-apa bayaran. Hanya diminta doakan keberkatan, keselamatan, kesihatan dan kebahagiaan ke atas orang yang saya sayang.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Text(
                'Terima kasih',
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: Text('Anda juga boleh menyumbang ke'),
              ),
              Container(
                child: Text('Tahfiz Al-Iman Bangi Avenue:'),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Text(
                  'TAHFIZ AL-IMAN',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  'MAYBANK ISLAMIC',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  '562263565705',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50.0,
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
