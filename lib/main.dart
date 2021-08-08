import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jomsolat/screens/solat_board.dart';

void main() => runApp(JomSolatApp());

class JomSolatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jom Solat',
      theme: ThemeData.dark(),
      home: SolatBoard(),
    );
  }
}
