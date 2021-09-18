import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

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
              SizedBox(
                height: 20.0,
              ),
              Text(
                'v' + _packageInfo.version,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Dedicated to NH ❤',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                height: 100.0,
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
