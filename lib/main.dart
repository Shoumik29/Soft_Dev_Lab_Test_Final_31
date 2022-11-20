import 'package:flutter/material.dart';
import 'package:weatherapi/Activities/forecast.dart';
import 'package:weatherapi/Activities/home.dart';
import 'package:weatherapi/Activities/loading.dart';


void main(){
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home": (context) => Home(),
      "/forecast": (context) => Forecast()
    },
  ));
}