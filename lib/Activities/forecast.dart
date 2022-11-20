import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  State<Forecast> createState() => _forecastState();
}

class _forecastState extends State<Forecast> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

        ),
      ),
    );
  }
}
