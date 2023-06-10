import 'package:flutter/material.dart';

class CrimeMap1 extends StatefulWidget {
  const CrimeMap1({Key? key}) : super(key: key);

  @override
  State<CrimeMap1> createState() => _CrimeMapState();
}

class _CrimeMapState extends State<CrimeMap1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network('https://thumbs.dreamstime.com/z/vector-'
          'perspective-city-map-markers-red-rounded-icons-61173973.jpg'),
    );
  }
}
